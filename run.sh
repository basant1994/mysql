#!/bin/sh
set -e
/usr/local/mysql/bin/mysqld_safe &
output=1

while [[ output -eq 1 ]]
do
	sleep 2;
	/usr/local/mysql/bin/mysql -uroot -e "status" > /dev/null 2>&1 && output=$? || output=1
done

if [ ! -f file.sql ]; then
	echo "CREATE USER \"$username\"@'localhost' IDENTIFIED BY \"$password\";" >> file.sql
	echo "GRANT ALL PRIVILEGES ON * . * TO \"$username\"@'localhost' WITH GRANT OPTION;" >> file.sql
	echo "CREATE USER \"$username\"@'%' IDENTIFIED BY \"$password\";" >> file.sql
	echo "GRANT ALL PRIVILEGES ON * . * TO \"$username\"@'%' WITH GRANT OPTION;" >> file.sql
	echo "FLUSH PRIVILEGES;" >> file.sql

	/usr/local/mysql/bin/mysql -uroot < file.sql	
fi
/usr/local/mysql/bin/mysql -u $username -p$password
bash