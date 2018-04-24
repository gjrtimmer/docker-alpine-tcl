[![build status](https://gitlab.timmertech.nl/docker/alpine-tcl/badges/master/build.svg)](https://gitlab.timmertech.nl/docker/alpine-tcl/commits/master)
[![](https://images.microbadger.com/badges/image/datacore/alpine-tcl.svg)](https://microbadger.com/images/datacore/alpine-tcl)
[![](https://images.microbadger.com/badges/version/datacore/alpine-tcl.svg)](https://microbadger.com/images/datacore/alpine-tcl)
[![](https://images.microbadger.com/badges/commit/datacore/alpine-tcl.svg)](https://microbadger.com/images/datacore/alpine-tcl)
[![](https://images.microbadger.com/badges/license/datacore/alpine-tcl.svg)](https://microbadger.com/images/datacore/alpine-tcl)

# Alpine Linux Tcl build image for GitLab

- [Docker Registries](#docker-registries)
- [Source Repositories](#source-repositories)
- [Installation](#installation)
  - [DockerHub](#install-from-dockerhub)
  - [TimmerTech](#install-from-timmertech)
- [Contents](#contents)


# Docker Registries

 - ```datacore/alpine-tcl:latest``` (DockerHub)
 - ```registry.timmertech.nl/docker/alpine-tcl:latest``` (registry.timmertech.nl)


# Source Repositories

- [github.com](https://github.com/GJRTimmer/docker-alpine-tcl)
- [gitlab.timmertech.nl](https://gitlab.timmertech.nl/docker/alpine-tcl)


# Installation

## Install from DockerHub
Download:
```bash
docker pull datacore/alpine-tcl:latest
```

Build:
```bash
docker build -t datacore/alpine-tcl https://github.com/GJRTimmer/docker-alpine-tcl
```


## Install from timmertech

Download:
```bash
docker pull registry.timmertech.nl/docker/alpine-tcl:latest
```

Build:
```bash
docker build -t datacore/alpine-tcl https://gitlab.timmertech.nl/docker/alpine-tcl
```

## Contents

| Item | Version | Description |
|------|---------|-------------|
| Tcl | 8.6.7 | Tool Command Language |

