#!/bin/sh
set -eu

export PGPASSWORD="${POSTGIS_PASSWORD:-gsb}"

psql \
  -v ON_ERROR_STOP=1 \
  -h "${POSTGIS_HOST:-postgis}" \
  -p "${POSTGIS_PORT:-5432}" \
  -U "${POSTGIS_USER:-gsb}" \
  -d "${POSTGIS_DB:-geostatusboard}" \
  -f /sql/postgis-spatialization.sql

