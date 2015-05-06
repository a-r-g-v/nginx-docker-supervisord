FROM debian:wheezy

RUN apt-get -y update && apt-get -y upgrade && apt-get install -y supervisor nginx wget

RUN echo deb http://dl.hhvm.com/debian wheezy main | tee /etc/apt/sources.list.d/hhvm.list
RUN wget -O - http://dl.hhvm.com/conf/hhvm.gpg.key | apt-key add -

RUN apt-get -y update && apt-get -y upgrade && apt-get install -y hhvm

RUN rm /etc/nginx/sites-enabled/default

ADD www /www/
ADD service.conf /etc/supervisor/conf.d/service.conf
ADD sites-enabled /etc/nginx/sites-enabled/

EXPOSE 80
CMD ["/usr/bin/supervisord"]
