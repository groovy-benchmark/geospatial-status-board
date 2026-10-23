# Geospatial Status Board Build Guide

This guide explains how to build the **Geospatial Status Board** (a Grails application for airport/airfield status with a MapLibre map view) on any machine: Linux, macOS (Intel or Apple Silicon), or Windows, on x86_64 or ARM64.

All paths in this guide are relative to the project root (the folder that contains `settings.gradle`) unless stated otherwise. Replace placeholders such as `<GRADLE_INSTALL_DIR>` with locations of your choice.

---

## 1. What you are building

| Item | Value |
|------|-------|
| Framework | Grails **5.3.3**, GORM 7.3.3, Spring Boot 2.7, Spring Security Core 5.2.1 |
| Language | Groovy 3.0.11 |
| Build tool | Gradle **7.6.6** (`gradle/wrapper/gradle-wrapper.properties`) |
| Required JDK | **17** (recommended and tested). Grails 5 does not support newer JDKs, and Gradle 7.6.6 cannot run on JDK 20+. |
| Modules | Root app (`:`) plus two Grails plugins: `gsb-airport` and `gsb-incidents` (see `settings.gradle`) |
| Database | H2 by default (no setup). Optional PostGIS via the `postgis` Spring profile. |
| Output | `GeoStatusBoard.war`, an executable Spring Boot WAR (the plain `war` task is disabled) |
| Context path | `/GeoStatusBoard` |

No Grails CLI is needed; everything is driven by Gradle.

---

## 2. Things to know before building

### 2.1 The Gradle wrapper jar is missing

`gradle/wrapper/gradle-wrapper.jar` is not in the repository, so `./gradlew` and `gradlew.bat` fail (`Could not find or load main class org.gradle.wrapper.GradleWrapperMain`). The same applies to `grailsw` / `grailsw.bat`. Install **Gradle 7.6.6** and run `gradle` directly (section 4).

Optional: once Gradle 7.6.6 is installed, `gradle wrapper --gradle-version 7.6.6` regenerates the wrapper (it rewrites `gradlew`, `gradlew.bat` and `gradle/wrapper/*`). On Linux/macOS, `gradlew` is also not marked executable in the repository; use `sh gradlew ...` or `chmod +x gradlew`.

### 2.2 Build output goes OUTSIDE the project by default

`build.gradle` redirects every module's `buildDir` to:

```
<LOCALAPPDATA or java.io.tmpdir>/GeoStatusBoardGradle/geospatial-status-board-<hash>/<module>/
```

- Windows: under `%LOCALAPPDATA%\GeoStatusBoardGradle\...`
- Linux/macOS: under the JVM temp dir (usually `/tmp/GeoStatusBoardGradle/...` on Linux, `$TMPDIR/GeoStatusBoardGradle/...` on macOS)

To keep the output inside the project (recommended, and what the rest of this guide assumes), pass the `gsb.buildRoot` system property:

```bash
gradle -Dgsb.buildRoot=build assemble
```

A relative value is resolved against the project root (an absolute path also works). The `build/` folder is already in `.gitignore`. With this setting the artifacts are:

| Module | Output |
|--------|--------|
| Root app | `build/root/libs/GeoStatusBoard.war` |
| gsb-airport | `build/gsb-airport/libs/gsb-airport-3.0.1-plain.jar` |
| gsb-incidents | `build/gsb-incidents/libs/gsb-incidents-4.4.1-plain.jar` |

The two module jars are already embedded in the WAR; only the WAR needs to be deployed.

---

## 3. Install JDK 17

Any OpenJDK 17 build works (Eclipse Temurin, Azul Zulu, Amazon Corretto, Microsoft, Liberica, etc.). All of them provide native x86_64 and ARM64 builds, including Apple Silicon.

| Platform | Command |
|----------|---------|
| SDKMAN (Linux, macOS, WSL) | `sdk install java 17.<x>-tem` (pick a version from `sdk list java`) |
| Debian / Ubuntu | `sudo apt install openjdk-17-jdk` |
| Fedora / RHEL | `sudo dnf install java-17-openjdk-devel` |
| Arch | `sudo pacman -S jdk17-openjdk` |
| macOS (Homebrew) | `brew install --cask temurin@17` |
| Windows (winget) | `winget install EclipseAdoptium.Temurin.17.JDK` |
| Windows (Chocolatey) | `choco install temurin17` |
| Manual | https://adoptium.net/temurin/releases/?version=17 |

Verify:

```bash
java -version    # must print version "17.x"
```

---

## 4. Install Gradle 7.6.6

| Option | Command |
|--------|---------|
| SDKMAN (Linux, macOS, WSL) | `sdk install gradle 7.6.6` |
| Manual (all platforms) | Download https://services.gradle.org/distributions/gradle-7.6.6-bin.zip and extract it to `<GRADLE_INSTALL_DIR>` |

Package managers (Homebrew, apt, Chocolatey, winget) install current Gradle 8/9, which is not compatible with this Grails 5 build. Use 7.6.6.

### 4.1 Environment variables

**Linux / macOS / WSL:**

```bash
export JAVA_HOME=<path-to-jdk17>
export PATH="$JAVA_HOME/bin:<GRADLE_INSTALL_DIR>/gradle-7.6.6/bin:$PATH"
```

**Windows PowerShell:**

```powershell
$env:JAVA_HOME = "<path-to-jdk17>"
$env:Path = "$env:JAVA_HOME\bin;<GRADLE_INSTALL_DIR>\gradle-7.6.6\bin;$env:Path"
```

**Windows cmd.exe:**

```bat
set JAVA_HOME=<path-to-jdk17>
set PATH=%JAVA_HOME%\bin;<GRADLE_INSTALL_DIR>\gradle-7.6.6\bin;%PATH%
```

Verify:

```bash
gradle -version    # Gradle 7.6.6, JVM: 17.x
```

---

## 5. Build

From the project root:

```bash
gradle --no-daemon -Dgsb.buildRoot=build assemble
```

PowerShell needs the property quoted: `gradle --no-daemon "-Dgsb.buildRoot=build" assemble`.

The first build downloads Grails 5.3.3 and all dependencies (Maven Central, `repo.grails.org`, Gradle Plugin Portal), cached in `~/.gradle` (`%USERPROFILE%\.gradle` on Windows), and takes a few minutes. It compiles both plugin modules, runs the asset pipeline (minified JS/CSS) and produces `build/root/libs/GeoStatusBoard.war` (about 80 MB).

Other useful commands:

```bash
gradle --no-daemon -Dgsb.buildRoot=build compileGroovy        # compile only
gradle --no-daemon -Dgsb.buildRoot=build clean                # delete outputs
gradle --no-daemon -Dgsb.buildRoot=build :gsb-airport:assemble  # one module only
```

`gradle build` additionally runs the tests; the functional (Geb) tests need Chrome/Firefox drivers (`-Dwebdriver.chrome.driver=...`). They are not needed to produce the WAR.

The build also creates an `.assetcache` file in the project root (ignored by Git).

---

## 6. Build with Docker (no local JDK or Gradle)

Works on any OS and CPU that runs Docker (`eclipse-temurin:17-jdk` is multi-arch). From the project root:

```bash
docker run --rm -v "$PWD":/src -w /src eclipse-temurin:17-jdk bash -c '
  set -e
  apt-get update -qq && apt-get install -y -qq unzip curl >/dev/null
  curl -fsSL -o /tmp/gradle.zip https://services.gradle.org/distributions/gradle-7.6.6-bin.zip
  unzip -q /tmp/gradle.zip -d /opt
  /opt/gradle-7.6.6/bin/gradle --no-daemon -Dgsb.buildRoot=/src/build assemble
'
```

On Windows PowerShell replace `"$PWD":/src` with `"${PWD}:/src"`. The WAR appears in `build/root/libs/` on the host. On Linux, files created by the container may be owned by `root`; remove them with `sudo` if needed.

---

## 7. Run

### 7.1 Self-contained (H2, sample data) - recommended for local testing

The `production` environment (the default for `java -jar`) uses `dbCreate: none` and does **not** create any users, so a plain `java -jar` on an empty H2 database fails with `Table "GSB_APP_BANNER_TEXT" not found`. For a ready-to-use instance, start the WAR in the **development** environment, which uses in-memory H2 databases, creates the schema and loads the sample data and the admin account:

```bash
java -Dgrails.env=development -jar build/root/libs/GeoStatusBoard.war
# Grails application running at http://localhost:8080/GeoStatusBoard in environment: development
```

Change the port with `--server.port=<port>` after the jar name.

Or run from source:

```bash
gradle --no-daemon -Dgsb.buildRoot=build :bootRun
# http://localhost:18088/GeoStatusBoard   (bootRun defaults to port 18088)
gradle --no-daemon -Dgsb.buildRoot=build :bootRun -Dserver.port=8080   # other port
```

Default account (development data): **admin / admin123**.

### 7.2 With PostGIS (`postgis` Spring profile)

`grails-app/conf/application-postgis.yml` switches all three datasources to PostgreSQL/PostGIS with `dbCreate: update` (schema created automatically). Connection settings come from environment variables:

| Variable | Default |
|----------|---------|
| `POSTGIS_HOST` | `localhost` |
| `POSTGIS_PORT` | `5432` |
| `POSTGIS_DB` | `geostatusboard` |
| `POSTGIS_USER` | `gsb` |
| `POSTGIS_PASSWORD` | `gsb` |

Start PostGIS (and optionally GeoServer) with the project's Compose file:

```bash
docker compose up -d postgis              # PostGIS only
docker compose up -d postgis geoserver    # plus GeoServer on http://localhost:8081/geoserver
```

(On Windows, `.\dev.ps1 up` does the same.) Then run the app with the profile:

```bash
java -jar build/root/libs/GeoStatusBoard.war --spring.profiles.active=postgis
```

Note: in the production environment no users are seeded, so you cannot log in on a fresh database. To get the sample data and `admin / admin123` on PostGIS as well, add `-Dgrails.env=development`:

```bash
java -Dgrails.env=development -jar build/root/libs/GeoStatusBoard.war --spring.profiles.active=postgis
```

The `postgis/postgis` image is multi-arch on recent tags; if your platform has no native image, add `platform: linux/amd64` to the service (or set `POSTGIS_IMAGE` in `.env`) and run it under emulation. Copy `.env.example` to `.env` to change ports, images or credentials. The `geoai` and `openclaw` Compose profiles are optional extras and are not needed to build or run the app (see the README).

### 7.3 URLs

| URL | Purpose |
|-----|---------|
| `/GeoStatusBoard/` | Home (redirects to `/GeoStatusBoard/login/auth` when not logged in) |
| `/GeoStatusBoard/login/auth` | Login form (posts `username` / `password` to `/GeoStatusBoard/login/authenticate`) |
| `/GeoStatusBoard/actuator` | Spring Boot actuator (all endpoints exposed in development only) |

---

## 8. Troubleshooting

| Symptom | Cause / Fix |
|---------|-------------|
| `Could not find or load main class org.gradle.wrapper.GradleWrapperMain` / `./gradlew: Permission denied` | Wrapper jar missing / not executable (section 2.1). Use Gradle 7.6.6 directly. |
| "BUILD SUCCESSFUL" but no `build/` folder in the project | Output went to the temp/LOCALAPPDATA folder (section 2.2). Pass `-Dgsb.buildRoot=build`. |
| `Unsupported class file major version 6x` or Gradle fails to start | Gradle 7.6.6 is running on JDK 20 or newer. Use JDK 17. |
| Errors with Gradle 8 or 9 (removed APIs, plugin incompatibilities) | Use Gradle 7.6.6. |
| `Table "GSB_APP_BANNER_TEXT" not found` at start-up | Production environment on an empty H2 database. Use `-Dgrails.env=development` or the `postgis` profile (section 7). |
| Login fails with `admin / admin123` | The app runs in the production environment, which does not seed users. Add `-Dgrails.env=development`. |
| `Connection to localhost:5432 refused` with the `postgis` profile | PostGIS is not running or uses another port; start it (section 7.2) and set `POSTGIS_*` variables. |
| `Could not resolve all dependencies` / SSL errors | Check access to `https://repo.grails.org`, `https://repo1.maven.org` and `https://plugins.gradle.org`. Behind a proxy, set `systemProp.https.proxyHost` / `systemProp.https.proxyPort` in `~/.gradle/gradle.properties`. |
| Out of memory while compiling | Increase `org.gradle.jvmargs` in `gradle.properties` (e.g. `-Xmx2g`). |
| Port already in use | `--server.port=<free port>` for the WAR, `-Dserver.port=<port>` for `bootRun`. |

---

## 9. Quick reference

```bash
# Requirements: JDK 17 + Gradle 7.6.6 on PATH (sections 3 and 4)
java -version              # 17.x
gradle -version            # 7.6.6

# Build (from the project root)
gradle --no-daemon -Dgsb.buildRoot=build assemble      # -> build/root/libs/GeoStatusBoard.war

# Run (H2 + sample data)
java -Dgrails.env=development -jar build/root/libs/GeoStatusBoard.war
# http://localhost:8080/GeoStatusBoard   login: admin / admin123
```
