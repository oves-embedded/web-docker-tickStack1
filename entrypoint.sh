#!/bin/bash

influx setup --bucket ${DOCKER_INFLUXDB_INIT_BUCKET} -t ${DOCKER_INFLUXDB_INIT_ADMIN_TOKEN} -o ${DOCKER_INFLUXDB_INIT_ORG} --username=${DOCKER_INFLUXDB_ADMIN_USER} --password=${DOCKER_INFLUXDB_ADMIN_PASSWORD} --host=http://influxd:8086 -f --skip-verify
