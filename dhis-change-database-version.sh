#!/bin/bash

version=$1

sed -i '/^connection.url/d' ~/dhis2/conf/dhis.conf
echo "connection.url = jdbc:postgresql:dhis$1" >> ~/dhis2/conf/dhis.conf

tail -3 ~/dhis2/conf/dhis.conf
