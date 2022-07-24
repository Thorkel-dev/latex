FROM debian:stable-slim
# removed latest ubuntu image due to ownership problems, last working image is focal
# image Name : latex_edouard

LABEL \
    image.title="Docker Image of TeXLive" \
    image.desc="Docker image to build PDF file with LaTeX" \
    image.source="https://github.com/Thorkel-dev/latex" \
    authors.name="Thorkel-dev" \
    authors.web="https://github.com/Thorkel-dev" \
    image.buildDate=$buildDate \
    base.name="debian:stable-slim"

ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ >/etc/timezone

RUN apt-get update && apt autoclean

RUN apt-get install -y default-jre graphviz make latexmk texlive-latex-base
RUN apt-get install texlive-latex-extra -y
RUN apt-get install texlive-font-utils -y
RUN apt-get install texlive-lang-french -y
RUN apt-get install texlive-bibtex-extra -y
RUN apt-get install biber -y
RUN apt-get install python3-pygments -y

RUN useradd -ms /bin/bash docker

USER docker