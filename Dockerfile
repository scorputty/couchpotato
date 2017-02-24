FROM alpine:latest
MAINTAINER scorputty
LABEL Description="CouchPotato" Vendor="S Corputty" Version="0.0.1"

# variables
ENV TZ="Europe/Amsterdam"
ENV appUser="media"
ENV appGroup="media"
ENV PUID="10000"
ENV PGID="10000"

# ports should be mapped with the run command to match your situation
EXPOSE 5050

# copy the start script to the container
COPY start.sh /start.sh

# install runtime packages
RUN \
 apk --update add --no-cache \
       ca-certificates \
       bash \
       su-exec \
       py2-pip \
       git \
       python \
       py-libxml2 \
       py-lxml \
       openssl-dev \
       unrar \
       tzdata \
       build-base && \

# update certificates
 update-ca-certificates && \

# install build packages (these will be removed later)
 apk add --no-cache --virtual=build-dependencies \
       g++ \
       gcc \
       libffi-dev\
       make \
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
       /tmp/*

# user with access to media files and config
RUN addgroup -g ${PGID} ${appGroup} && \
  adduser -G ${appGroup} -D -u ${PUID} ${appUser}

# create dir to be mounted over by volume
RUN mkdir -p /share/config/sickrage && touch /share/config/sickrage/tag.txt

# make media user owner of the software
RUN chown -R ${appGroup}:${appUser} /start.sh /CouchPotatoServer /share

# make sure start.sh is executable
RUN chmod u+x  /start.sh

# switch to App user
USER ${appUser}

# single mounted shared volume
VOLUME ["/share"]

# start application
CMD ["/start.sh"]
