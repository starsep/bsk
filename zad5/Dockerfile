FROM ioft/i386-ubuntu
MAINTAINER Filip Czaplicki <fc359081@students.mimuw.edu.pl>
RUN apt-get update && apt-get install -y apache2
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
