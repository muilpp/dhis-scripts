#!/bin/bash

containerId=`docker ps -aqf ancestor=postgis/postgis:10-2.5-alpine | awk 'NR==1'`
echo $containerId
docker exec -it $containerId /bin/bash -c "psql -U dhis"