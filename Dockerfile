FROM python:2.7.12

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

