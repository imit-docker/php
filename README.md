# Containers para uso general del PHP

## Uso


### Crear la imagen ejecutar 

```bash

./build.sh

```

o el directamente el comando docker que sigue

```bash

docker build --force-rm=true --no-cache=true . -t imit/php:5-apache-oci

```
	

### Crear container

```bash

./run.sh

```

o directamente el comando docker que sigue

```bash

docker run -d --shm-size=1g  -i -t -p 127.0.0.1:5080:80 -h dc-php5  -v <path-to-app>:/var/www/html -P --name="dc-php5" imit/php:5-apache-oci 

```








