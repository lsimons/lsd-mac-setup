#!/bin/bash

# allow java 8 to read jaxp schemas
# http://stackoverflow.com/questions/23011547/webservice-client-generation-error-with-jdk8

set -e

echo 'javax.xml.accessExternalSchema = all' > jaxp.properties
sudo mv jaxp.properties $(/usr/libexec/java_home -v 1.8 -F)/jre/lib/
