#!/bin/sh

until nc -z database 3306
do
    sleep 1
done

/usr/local/bundle/bin/passenger start --port 4000
