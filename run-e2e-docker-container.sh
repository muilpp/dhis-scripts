#!/bin/bash

cd ~/workspace/dhis/dhis2-core/dhis-2/dhis-test-e2e
docker compose down && docker compose up --detach

port80=`docker compose port web 8080`
port81=`docker compose port web 8081`

port80Value=${port80#*:}
port81Value=${port81#*:}

echo "Run port 8080:" $port80Value
echo "Debug port 8081:" $port81Value
