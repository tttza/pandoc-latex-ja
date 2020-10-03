FROM pandoc/latex:latest

RUN tlmgr option repository http://mirror.ctan.org/systems/texlive/tlnet
RUN tlmgr update --self --all
RUN tlmgr install \
    bxjscls \
    luatexja \
    collection-langjapanese \
    ctex \
    type1cm 

RUN wget -O - \
    https://github.com/lierdakil/pandoc-crossref/releases/latest/download/pandoc-crossref-Linux.tar.xz | \
    tar Jxf - \
    && mv pandoc-crossref /usr/lib/ \
    && rm -rf pandoc-crossref.1

# gitlab-ciで動作するよう修正。 ref: https://github.com/brospars/docker-pandoc-gitlab-ci
RUN apk update && apk add \
    bash \
    git

ENTRYPOINT ["/bin/bash", "-l", "-c"]

WORKDIR /build
