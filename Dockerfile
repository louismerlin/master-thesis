FROM debian

RUN apt-get update && \
    apt-get install -y make texlive-base texlive-bibtex-extra texlive-latex-base \
                       texlive-latex-extra texlive-latex-recommended \
                       texlive-science texlive-lang-german texlive-lang-french \
                       texlive-bibtex-extra biber rubber && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
