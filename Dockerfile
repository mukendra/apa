##############################################################
#Dockerfile to build Apache2 container images
#Based on Ubuntu
##############################################################

FROM ubuntu
MAINTAINER mukki
RUN apt-get update && apt-get -y install apache2 git nano 
RUN a2enmod ssl
RUN mkdir /etc/apache2/ssl
WORKDIR /opt 
RUN git clone https://github.com/mukendra/apa.git
#RUN cp /opt/.htpasswd /etc/apache2/.htpasswd
#ADD .htaccess /var/www/html
RUN cp/opt/apa/000-default.conf  /etc/apache2/sites-available
#ADD mukki /var/www/html/index.html
RUN cp /opt/apa/apache.key /etc/apache2/ssl
RUN cp /opt/apa/apache.crt /etc/apache2/ssl
RUN a2ensite default-ssl
ENTRYPOINT service apache2 restart && sleep 3600
EXPOSE 80
