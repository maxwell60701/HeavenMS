# Docker support, thanks to xinyifly

FROM openjdk:8u191-jdk-alpine
RUN apk -U add tini
RUN apk add sudo
RUN apk add apache-ant

WORKDIR /mnt
COPY ./ ./
RUN sh ./linux-compile.sh

EXPOSE 8484 7575 7576 7577
ENTRYPOINT ["tini", "--"]
CMD sh ./linux-launch.sh
