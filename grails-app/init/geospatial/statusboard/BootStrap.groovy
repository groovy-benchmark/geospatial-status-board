package geospatial.statusboard

import grails.util.Environment

class BootStrap {

    def init = { servletContext ->
        if (Environment.current == Environment.PRODUCTION) {
            return
        }

        UserRole.withTransaction {
            Role userRole = Role.findByAuthority('ROLE_USER') ?: new Role(authority: 'ROLE_USER').save(failOnError: true)
            Role adminRole = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(failOnError: true)

            User adminUser = User.findByUsername('admin') ?: new User(
                username: 'admin',
                password: 'admin123',
                enabled: true
            ).save(failOnError: true)

            if (!UserRole.exists(adminUser.id as long, userRole.id as long)) {
                UserRole.create(adminUser, userRole, true)
            }

            if (!UserRole.exists(adminUser.id as long, adminRole.id as long)) {
                UserRole.create(adminUser, adminRole, true)
            }
        }
    }

    def destroy = {
    }
}
