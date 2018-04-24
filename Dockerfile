FROM registry.timmertech.nl/docker/alpine-glibc:latest

ARG BUILD_DATE
ARG VCS_REF
ENV TCLLIB=1.19
ENV TDOM=0.9.0

LABEL \
	maintainer="G.J.R. Timmer <gjr.timmer@gmail.com>" \
	nl.timmertech.build-date=${BUILD_DATE} \
	nl.timmertech.name=alpine-tcl \
	nl.timmertech.vendor=timmertech.nl \
	nl.timmertech.vcs-url="https://github.com/GJRTimmer/docker-alpine-tcl.git" \
	nl.timmertech.vcs-ref=${VCS_REF} \
	nl.timmertech.license=MIT

RUN echo '@community http://dl-cdn.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories && \
	echo '@edge http://dl-cdn.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories && \
	apk add --upgrade --no-cache --update ca-certificates wget git curl openssh tar gzip apk-tools@edge && \
	apk upgrade --update --no-cache

# Tcl
RUN set -ex && \
	apk add --no-cache \
		bash \
		gcc \
		musl-dev \
		openssl \
		openssl-dev \
		tcl \
		tcl-tls \
		tclx \
		pgtcl \
		expect && \
		rm -rf /var/cache/apk/*

# Tcllib
RUN curl -sSL https://github.com/tcltk/tcllib/archive/release.tar.gz | tar -xz -C /tmp && \
	tclsh /tmp/tcllib-release/installer.tcl -no-html -no-nroff -no-examples -no-gui -no-apps -no-wait -pkg-path /usr/lib/tcllib && \
	rm -rf /tmp/tcllib*

# tDOM
RUN apk add --no-cache tcl-dev build-base && \
    curl -sSL http://tdom.org/downloads/tdom-0.9.0-src.tgz | tar -xz -C /tmp/ && \
    cd /tmp/tdom-0.9.0/unix && \
    ../configure && \
    make && \
    make install && \
    cd / && \
    rm -rf /tmp/tdom-0.9.0* && \
    apk del build-base tcl-dev

COPY rootfs /

VOLUME ["/opt/tcl", "/opt/tcl/lib"]
WORKDIR /opt/tcl

ENV TCLLIBPATH /opt/tcl /opt/tcl/lib

ENTRYPOINT ["tclsh"]

# EOF