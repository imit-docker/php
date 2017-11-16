#!/bin/bash

set -x


sudo docker build --force-rm=true --no-cache=true . -t imit/php:5-apache-oci
