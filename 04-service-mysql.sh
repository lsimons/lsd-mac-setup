#!/bin/bash

# install mysql

set -e

brew install mysql

(brew services stop mysql || true)

cat >/usr/local/etc/my.cnf <<END
[mysqld]
# you may find out the hard way about mysql charset bugs
# when using the default UTF-8. Trust us, you want this :-)
character-set-client-handshake = FALSE
character-set-server = utf8mb4
collation-server = utf8mb4_unicode_ci
init-connect='SET NAMES utf8mb4'

# allow working with large binary blobs
max_allowed_packet=500M
END

brew services start mysql
