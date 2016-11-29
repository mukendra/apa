##############################################################
#Dockerfile to build Apache2 container images
#Based on Ubuntu
##############################################################

FROM ubuntu
MAINTAINER mukki
RUN apt-get update && apt-get -y install apache2
RUN a2enmod ssl
RUN mkdir /etc/apache2/ssl
ADD .htpasswd /etc/apache2/.htpasswd
ADD .htaccess /var/www/html
ADD 000-default.conf  /etc/apache2/sites-available
ADD mukki /var/www/html/index.html
ADD apache.key /etc/apache2/ssl
ADD apache.crt /etc/apache2/ssl
RUN a2ensite default-ssl
ENTRYPOINT service apache2 restart && sleep 3600
EXPOSE 80
