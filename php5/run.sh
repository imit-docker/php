#!/bin/bash
set -x

sudo docker stop dc-php5

sudo docker rm dc-php5

sudo docker run -d --shm-size=1g  -i -t -p 127.0.0.1:5080:80 -h dc-php5  -v /Users/luiz.quelves/projects/docker/php/php5/app:/var/www/html -P --name="dc-php5" imit/php:5-apache-oci 
