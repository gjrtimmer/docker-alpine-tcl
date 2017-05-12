FROM registry.timmertech.nl/docker/alpine-glibc:latest
MAINTAINER G.J.R. Timmer <gjr.timmer@gmail.com>

ARG BUILD_DATE
ARG VCS_REF

LABEL \
	nl.timmertech.build-date=${BUILD_DATE} \
	nl.timmertech.name=alpine-tcl \
	nl.timmertech.vendor=timmertech.nl \
	nl.timmertech.vcs-url="https://github.com/GJRTimmer/docker-alpine-tcl.git" \
	nl.timmertech.vcs-ref=${VCS_REF} \
	nl.timmertech.license=MIT

RUN apk add --no-cache --update ca-certificates wget git curl openssh && \
	apk upgrade --update --no-cache
	
RUN set -ex && \
	apk add --no-cache \
		bash \
		gcc \
		musl-dev \
		openssl \
		openssl-dev \
		alpine-sdk \
		tcl

# EOF