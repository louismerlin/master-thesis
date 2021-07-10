
name=thesis

all: *.tex *.bib
	docker build -t master-thesis .
	docker run -it --rm -v "${PWD}:/app" master-thesis rubber --pdf $(name).tex
	sudo chown ${USER} $(name).pdf

clean:
	docker run -it --rm -v "${PWD}:/app" master-thesis rubber --clean --pdf $(name).tex
