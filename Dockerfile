FROM alpine:latest

LABEL org.opencontainers.image.title="Docker Image of TeXLive for report"
LABEL org.opencontainers.image.description="Docker image to build PDF file with LaTeX"
LABEL org.opencontainers.image.url="ghcr.io/thorkel-dev/latex/alpine-texlive-report"
LABEL org.opencontainers.image.authors.name="Thorkel-dev"
LABEL org.opencontainers.image.authors.web="https://github.com/Thorkel-dev"
LABEL org.opencontainers.image.created =$buildDate
LABEL org.opencontainers.image.base.name="alpine:latest"
LABEL org.opencontainers.image.base.source="https://hub.docker.com/_/alpine/?tab=tags"

ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ >/etc/timezone

RUN apk update

RUN apk add --no-cache plantuml
RUN apk add --no-cache graphviz
RUN apk add --no-cache make
RUN apk add --no-cache py3-pygments
RUN apk add --no-cache texlive
RUN apk add --no-cache biber
RUN apk add --no-cache texmf-dist-bibtexextra
RUN apk add --no-cache texmf-dist-latexextra
RUN apk add --no-cache git
RUN apk add --no-cache git-lfs
RUN apk add --no-cache msttcorefonts-installer fontconfig
RUN update-ms-fonts

# Create a new user and log the shell on the new user
RUN adduser -D docker
# # Switch the docker image to the new user
USER docker
