FROM alpine:edge
MAINTAINER mkoukal
ENV PACKAGES="\
  outils-cksum \
  bash"

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" > /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk add --no-cache $PACKAGES || \
    (sed -i -e 's/dl-cdn/dl-4/g' /etc/apk/repositories && apk add --no-cache $PACKAGES) 



WORKDIR /app/filewatcher
COPY ./filewatcher.sh .

ENV  CMD='ls'
ENV  FILE=''

ENTRYPOINT ["/app/filewatcher/filewatcher.sh"]

