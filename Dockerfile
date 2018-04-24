FROM registry.timmertech.nl/docker/alpine-glibc:latest

ARG BUILD_DATE
ARG VCS_REF

LABEL \
	maintainer="G.J.R. Timmer <gjr.timmer@gmail.com>" \
	nl.timmertech.build-date=${BUILD_DATE} \
	nl.timmertech.name=alpine-tcl \
	nl.timmertech.vendor=timmertech.nl \
	nl.timmertech.vcs-url="https://github.com/GJRTimmer/docker-alpine-tcl.git" \
	nl.timmertech.vcs-ref=${VCS_REF} \
	nl.timmertech.license=MIT

RUN echo 'http://dl-cdn.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories && \
	apk add --no-cache --update ca-certificates wget git curl openssh && \
	apk upgrade --update --no-cache
	
RUN set -ex && \
	apk add --no-cache \
		bash \
		gcc \
		musl-dev \
		openssl \
		openssl-dev \
		alpine-sdk \
		tcl \
		tcl-tls \
		tclx

# EOF