#!/bin/bash

# Credentials
read -p "> User:" USER
read -s -p "> Password:" PASSWORD

# Fetch DB list
databases=`mysql -u $USER -p$PASSWORD -e "SHOW DATABASES;" | tr -d "| " | grep -v Database`

# DB choices
echo -e '\n> DB Found :'
select DB_EXPORT in $databases;
do
	echo '> DB to export :' $DB_EXPORT \($REPLY\)
	break;
done

# Export
echo 'start'
mysqldump -u $USER -p$PASSWORD --databases $DB_EXPORT > ./`date +%Y%m%d`-`date +%H%M%S`.$DB_EXPORT.sql
echo 'done'
