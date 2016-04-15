FROM ubuntu:trusty
MAINTAINER Marcelo Salazar <marcelo.salazar@latam.com>

ENV DEBIAN_FRONTEND noninteractive

RUN dpkg --add-architecture i386

RUN apt-get update -y \
    && apt-get install -y wget netcat wine gettext \
    && wget -q "http://deb.playonlinux.com/public.gpg" -O- | apt-key add - \
    && wget http://deb.playonlinux.com/playonlinux_trusty.list -O /etc/apt/sources.list.d/playonlinux.list \
    && apt-get update -y \
    && apt-get install -y playonlinux \
    && apt-get autoremove \
    && apt-get clean \
    && rm -rf /tmp/*


RUN sed -i 's/encoding = \"ascii\"/encoding = \"utf-8\"/g' /usr/lib/python2.7/site.py


RUN curl -o /usr/local/bin/gosu -SL --insecure "https://github.com/tianon/gosu/releases/download/1.7/gosu-$(dpkg --print-architecture)" \
    && echo "34049cfc713e8b74b90d6de49690fa601dc040021980812b2f1f691534be8a50  /usr/local/bin/gosu" | sha256sum -c - \
    && chmod +x /usr/local/bin/gosu


RUN adduser --disabled-password --gecos "" pol \
    && usermod -aG video pol

ENV HOME /home/pol
ENV USER pol

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh" ]
