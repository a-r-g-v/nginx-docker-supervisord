FROM debian:wheezy

RUN apt-get -y update && apt-get -y upgrade && apt-get install -y supervisor vim zsh nginx

RUN mkdir /work/
ADD setup.sh /etc/work/setup.sh

ADD nginx.conf /etc/supervisor/conf.d/nginx.conf

WORKDIR /etc/work
EXPOSE 80
CMD ["bash", "setup.sh"]
