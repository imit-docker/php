FROM debian:wheezy

MAINTAINER luiz@quelves.com

ENV ORACLE_HOME=/usr/local/instantclient/

# Oracle instantclient
ADD ../setup/instantclient-basic-linux.x64-12.1.0.2.0.zip /tmp/
ADD ../setup/instantclient-sdk-linux.x64-12.1.0.2.0.zip /tmp/
ADD ../setup/instantclient-sqlplus-linux.x64-12.1.0.2.0.zip /tmp/


#metodo 0
RUN echo 'deb http://packages.dotdeb.org wheezy-php55 all' >> /etc/apt/sources.list
RUN echo 'deb-src http://packages.dotdeb.org wheezy-php55 all' >> /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E9C74FEEA2098A6E


#metodo 1
#gpg --keyserver packages.dotdeb.org --recv-key  E9C74FEEA2098A6E
#gpg -a --export E9C74FEEA2098A6E | sudo apt-key add -


#metodo 2
#wget http://www.dotdeb.org/dotdeb.gpg
#apt-key add dotdeb.gpg

RUN apt-get -y update
RUN apt-get -y install php5 apache2 libapache2-mod-php5 php-pear unzip libaio1 php5-dev vim


RUN ln -s /etc/apache2/mods-available/php5.conf /etc/apache2/mods-enabled/php5.conf
RUN ln -s /etc/apache2/mods-available/php5.load /etc/apache2/mods-enabled/php5.load

#Create oracle client directory
RUN mkdir -p /usr/lib/oracle/12.1/client64/lib


#Install instant client
RUN cd /tmp
RUN unzip /tmp/instantclient-basic-linux.x64-12.1.0.2.0.zip 
RUN unzip /tmp/instantclient-sdk-linux.x64-12.1.0.2.0.zip 
RUN unzip /tmp/instantclient-sqlplus-linux.x64-12.1.0.2.0.zip 

RUN mv instantclient_12_1/* /usr/lib/oracle/12.1/client64/lib/

RUN ln -s /usr/lib/oracle/12.1/client64/lib/libclntsh.so.12.1 /usr/lib/oracle/12.1/client64/lib/libclntsh.so

RUN ls -alt /usr/lib/oracle/12.1/client64/lib/

#Agregar LD_LIBRARY
RUN echo '/usr/lib/oracle/12.1/client64/lib' > /etc/ld.so.conf.d/x86_64-oracle.conf
RUN ldconfig

#Install oci8
RUN echo 'instantclient,/usr/lib/oracle/12.1/client64/lib' | pecl install oci8-2.0.10
RUN echo 'extension=oci8.so' > /etc/php5/mods-available/oci8.ini
RUN ln -s /etc/php5/mods-available/oci8.ini /etc/php5/cli/conf.d/oci8.ini 
RUN ln -s /etc/php5/mods-available/oci8.ini /etc/php5/apache2/conf.d/oci8.ini 

RUN service apache2 restart

EXPOSE 80

CMD apachectl -D FOREGROUND








