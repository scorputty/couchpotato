FROM alpine:latest
MAINTAINER scorputty
LABEL Description="CouchPotato" Vendor="S Corputty" Version="3.0.1"

# variables
ENV appUser="media"
ENV appGroup="1000"

# mounted volumes should be mapped to media files and config with the run command
VOLUME ["/config", "/data"]

# ports should be mapped with the run command to match your situation
EXPOSE 5050

# copy the start script to the container
COPY start.sh /start.sh

# install runtime packages
RUN \
 apk add --no-cache \
        ca-certificates \
        python \
        py-pip \
        py-libxml2 \
        py-lxml \
        build-base && \

# update certificates
 update-ca-certificates && \

# install build packages
 apk add --no-cache --virtual=build-dependencies \
        g++ \
        gcc \
        libffi-dev\
        openssl-dev \
        make \
        git \
        python-dev && \

# install pip packages
 pip install --no-cache-dir -U \
        incremental \
        pip && \
 pip install --no-cache-dir -U \
        setuptools \
        pyopenssl && \

# get CouchPotatoServer software
  git clone --depth 1 https://github.com/RuudBurger/CouchPotatoServer.git /CouchPotatoServer && \

# cleanup
 cd / && \
 apk del --purge \
        build-dependencies && \
 rm -rf \
        /var/cache/apk/* \
        /tmp/src \
        /CouchPotatoServer/.git \
        /tmp/*

# user with access to media files and config
RUN adduser -D -u ${appGroup} ${appUser}

# make media user owner of the software
RUN chown -R ${appGroup}:${appUser} /CouchPotatoServer

# switch to application directory
WORKDIR /CouchPotatoServer

# switch to user media
USER media

# start application
CMD ["/start.sh"]
