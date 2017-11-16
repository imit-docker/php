#!/bin/bash
set -x

sudo docker stop dc-php55

sudo docker rm dc-php55

sudo docker run -d --shm-size=1g  -i -t -p 127.0.0.1:5080:80 -h dc-php55  -v /Users/luiz.quelves/projects/docker/php/php55/app:/var/www -P --name="dc-php55" imit/php:55-apache-oci
