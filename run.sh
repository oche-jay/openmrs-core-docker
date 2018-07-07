#!/bin/bash

# service mysql start
# mysql -uroot -e "CREATE DATABASE openmrs"
# mysql -uroot -e "GRANT ALL PRIVILEGES ON * . * TO 'root'@'%'"
# mysql -uroot -e "UPDATE mysql.user SET Password=PASSWORD('test') WHERE User='root'"
# mysql -uroot -ptest -e "FLUSH PRIVILEGES"

/etc/init.d/tomcat7 start

# The container will run as long as the script is running, that's why
# we need something long-lived here
exec tail -f /usr/local/tomcat/logs/catalina.out
