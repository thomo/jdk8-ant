FROM openjdk:8-jdk-alpine

LABEL org.opencontainers.image.authors="Thomas.Mohaupt@gmail.com"
LABEL org.opencontainers.image.url="https://github.com/thomo/jdk8-ant"
LABEL org.opencontainers.image.documentation="https://github.com/thomo/jdk8-ant/blob/main/README.md"
LABEL org.opencontainers.image.version="1.0"
LABEL org.opencontainers.image.description="jdk8 with ant"

RUN adduser -D dev

RUN mkdir /data && chown dev /data

RUN apk update 
RUN apk add --no-cache apache-ant 
RUN rm -rf /var/cache/apk/*

USER dev

VOLUME /data
WORKDIR /data

CMD ["ant"]
