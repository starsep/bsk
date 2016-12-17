FROM ioft/i386-ubuntu
MAINTAINER Filip Czaplicki <fc359081@students.mimuw.edu.pl>
RUN apt-get update && apt-get install -y apache2
RUN a2enmod ssl
RUN a2ensite default-ssl
COPY newcert.pem /etc/ssl/certs/ssl-cert-snakeoil.pem
COPY newkey.pem /etc/ssl/private/ssl-cert-snakeoil.key
RUN service apache2 restart
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
