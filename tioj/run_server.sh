#!/bin/sh

until nc -z database 3306
do
    sleep 1
done

rake db:migrate
/usr/local/bundle/bin/passenger start --port 4000
