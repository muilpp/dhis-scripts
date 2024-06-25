#!/bin/bash

read -p 'Are you using version 41 or above? (y/n) ' is_new_version

if [ "$is_new_version" = "y" ]; then
	containerId=$(docker ps -aqf ancestor=postgis/postgis:13-3.4-alpine | awk 'NR==1')
else
	containerId=$(docker ps -aqf ancestor=postgis/postgis:10-2.5-alpine | awk 'NR==1')
fi

if [ -z "$containerId" ]; then
	echo "No container found with the specified image."
	exit 1
fi

echo "$containerId"
docker exec -it "$containerId" /bin/bash -c "psql -U dhis"
