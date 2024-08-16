#!/bin/bash

cd ~/workspace/dhis/dhis2-core/dhis-2/dhis-test-e2e
mvn test -Dinstance.url=http://localhost:$1/api -Dtest.cleanup=true -Duser.default.username=admin -Duser.default.password=district -Dtest.track_called_endpoints=true -Dtest=$2
#mvn test -Dinstance.url=http://localhost:$1/api -Dtest.cleanup=true -Duser.default.username=admin -Duser.default.password=district -Dtest.track_called_endpoints=true -Dtest=org.hisp.dhis.tracker.imports.OwnershipTests#shouldValidateEnrollmentOwnership
