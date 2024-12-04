#!/bin/bash

printf "\\set AUTOCOMMIT on\nSELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity WHERE pg_stat_activity.datname = 'dhisdev' AND pid <> pg_backend_pid();\nDROP DATABASE IF EXISTS dhisdev;\n" \
| psql postgres

if [ $? -eq 0 ]; then
  sudo -u postgres createdb -O marc dhisdev && \
  psql -d dhisdev -U marc -f ~/Downloads/dhis-db/dhis2-db-sierra-leone-dev.sql && \
  ~/workspace/scripts/dhis-scripts/dhis-change-database-version.sh dev
else
  echo "Error: Failed to terminate connections or drop the database."
  exit 1
fi
