FROM pandoc/latex:latest

# RUN apk update && apk search  - texlive-xelatex
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
