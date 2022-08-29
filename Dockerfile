FROM debian:stable-slim

LABEL org.opencontainers.image.title="Docker Image of TeXLive"
LABEL org.opencontainers.image.description="Docker image to build PDF file with LaTeX"
LABEL org.opencontainers.image.url=" ghcr.io/thorkel-dev/latex/debian-texlive"
LABEL org.opencontainers.image.authors="Thorkel-dev"
LABEL org.opencontainers.image.authors.web="https://github.com/Thorkel-dev"
LABEL org.opencontainers.image.created =$buildDate
LABEL org.opencontainers.image.base.name="debian:stable-slim"
LABEL org.opencontainers.image.base.source="https://hub.docker.com/_/debian/?tab=tags"

ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ >/etc/timezone

RUN apt-get update && apt autoclean

RUN apt-get install plantuml -y
RUN apt-get install graphviz -y
RUN apt-get install build-essential -y
RUN apt-get install latexmk -y
RUN apt-get install python3-pygments -y
RUN apt-get install texlive-latex-base -y
RUN apt-get install texlive-latex-extra -y
RUN apt-get install texlive-font-utils -y
RUN apt-get install texlive-lang-french -y
RUN apt-get install texlive-lang-english -y
RUN apt-get install texlive-bibtex-extra -y
RUN apt-get install biber -y

# Create a new user and log the shell on the new user
RUN useradd -ms /bin/bash docker
# Switch the docker image to the new user
USER docker