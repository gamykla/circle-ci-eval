FROM python:2.7.12

RUN apt-get update && apt-get install -y apt-transport-https ca-certificates
RUN apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
RUN echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" | tee /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-engine && chmod u+s /usr/bin/docker

EXPOSE 8080

RUN useradd --home /content --shell /bin/false --user-group app-user

RUN curl -Lso /tmp/dumb-init.deb \
    https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64.deb \
    && dpkg -i /tmp/dumb-init.deb

CMD ["boot"]
ENTRYPOINT ["/usr/bin/dumb-init","/content/docker-entrypoint.sh"]

ADD requirements /requirements
RUN pip install -r /requirements/base.txt

ADD content /content

RUN chown -R app-user /content
USER app-user
WORKDIR /content

