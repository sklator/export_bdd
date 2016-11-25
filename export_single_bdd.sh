#!/bin/bash

USER="root"
read -s -p "> Root password:" PASSWORD

databases=`mysql -u $USER -p$PASSWORD -e "SHOW DATABASES;" | tr -d "| " | grep -v Database`

echo -e '\n> DB Found :'

select DB_EXPORT in $databases;
do
	echo '> DB to export :' $DB_EXPORT \($REPLY\)
	break;
done

echo 'start'
mysqldump -u $USER -p$PASSWORD --databases $DB_EXPORT > ~/dumps/`date +%Y%m%d`.$DB_EXPORT.sql
echo 'done'
