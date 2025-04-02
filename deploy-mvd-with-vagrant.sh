#!/bin/bash

# TODO: Do gradle build before deploying to vms
./gradlew clean
./gradlew build
./gradlew copyOpenTelemetryJar
cd deployment
vagrant up
vagrant destroy mvd-ansible-control-vm -f
