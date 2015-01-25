FROM debian:wheezy

RUN apt-get -y update && apt-get -y upgrade && apt-get install -y supervisor nginx wget

RUN echo deb http://dl.hhvm.com/debian wheezy main | tee /etc/apt/sources.list.d/hhvm.list
RUN wget -O - http://dl.hhvm.com/conf/hhvm.gpg.key | apt-key add -

RUN apt-get -y update && apt-get -y upgrade && apt-get install -y hhvm

RUN mkdir /etc/work/
ADD setup.sh /etc/work/setup.sh

ADD nginx.conf /etc/supervisor/conf.d/nginx.conf

WORKDIR /etc/work
EXPOSE 80
CMD ["bash", "setup.sh"]
