FROM debian:wheezy

RUN apt-get -y update && apt-get -y upgrade && apt-get install -y supervisor nginx wget

ADD hhvm.list /etc/apt/sources.list.d/hhvm.list 
RUN wget -O - http://dl.hhvm.com/conf/hhvm.gpg.key | apt-key add -

RUN apt-get -y update && apt-get -y upgrade && apt-get install -y hhvm


RUN mkdir /work/
ADD setup.sh /etc/work/setup.sh

ADD service.conf /etc/supervisor/conf.d/service.conf

WORKDIR /etc/work
EXPOSE 80
CMD ["bash", "setup.sh"]
