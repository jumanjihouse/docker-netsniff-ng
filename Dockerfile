FROM alpine:edge

ENV VERSION 0.5.8-r0

RUN echo 'http://dl-4.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
    apk add --update \
      netsniff-ng=${VERSION} \
      && \
    rm -fr /var/cache/apk/*

ENTRYPOINT ["netsniff-ng"]
CMD ["--help"]
