#!/bin/bash

# allow java to talk to el cheapo ssl provider

set -e

curl -o startcom-ca.crt https://www.startssl.com/certs/ca.crt
curl -o startcom-intermediate.crt https://www.startssl.com/certs/ca-sha2.crt

# doesn't work, but java 1.6 SSL is too old for use anyway
# java_home=$(/usr/libexec/java_home -v 1.6)
# sudo ${java_home}/bin/keytool -import -noprompt -keystore /System/Library/Java/Support/CoreDeploy.bundle/Contents/Home/lib/security/cacerts -storepass changeit -trustcacerts -file startcom-ca.crt -alias StartCom_Root
# sudo ${java_home}/bin/keytool -import -noprompt -keystore /System/Library/Java/Support/CoreDeploy.bundle/Contents/Home/lib/security/cacerts -storepass changeit -file startcom-intermediate.crt -alias StartCom_Intermediate

for v in 1.7 1.8; do
  java_home=$(/usr/libexec/java_home -v $v)
  if [[ "$(${java_home}/bin/keytool -list -noprompt -keystore ${java_home}/jre/lib/security/cacerts -storepass changeit | grep -i StartCom_Root)" == "" ]]; then
    sudo ${java_home}/bin/keytool -import -noprompt -keystore ${java_home}/jre/lib/security/cacerts -storepass changeit -trustcacerts -file startcom-ca.crt -alias StartCom_Root
  fi
  if [[ "$(${java_home}/bin/keytool -list -noprompt -keystore ${java_home}/jre/lib/security/cacerts -storepass changeit | grep -i StartCom_Intermediate)" == "" ]]; then
    sudo ${java_home}/bin/keytool -import -noprompt -keystore ${java_home}/jre/lib/security/cacerts -storepass changeit -file startcom-intermediate.crt -alias StartCom_Intermediate
  fi
done

rm -f startcom-ca.crt startcom-intermediate.crt
