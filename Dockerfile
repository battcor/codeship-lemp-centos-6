FROM battcor/docker-lemp-centos-6:latest

MAINTAINER Battcor <battcor@gmail.com>

WORKDIR /var/www/html

ADD files/index.php .
ADD files/start.sh .
ADD files/supervisord.conf /etc/supervisord.conf

ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY
ARG AWS_DEFAULT_REGION

RUN echo $AWS_ACCESS_KEY_ID && \
    echo $AWS_SECRET_ACCESS_KEY && \
    echo $AWS_DEFAULT_REGION

CMD ["sh", "start.sh"]

EXPOSE 80
EXPOSE 443
