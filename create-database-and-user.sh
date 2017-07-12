#!/bin/sh
read -sp "DB Name: " dbname
echo $dbname
dbpass=`mkpasswd -l 16`
echo "DB Password: ${dbpass}"
echo '(root user for mysql)'
SQL_CREATE_DATABASE="CREATE DATABASE ${dbname} DEFAULT CHARACTER SET utf8;GRANT ALL PRIVILEGES ON  ${dbname}.* TO '${dbname}'@'localhost' IDENTIFIED BY '${dbpass}';"
eval "mysql -u root -p -e \""$SQL_CREATE_DATABASE"\""
exit 0