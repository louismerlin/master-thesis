
name=thesis

all: *.tex *.bib
	docker build -t master-thesis .
	docker run -it --rm -v "${PWD}:/app" master-thesis rubber --pdf $(name).tex
	chown ${USER} *

clean:
	rubber --clean --pdf $(name).tex

