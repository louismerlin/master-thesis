
name=thesis

all: *.tex *.bib
	docker build -t master-thesis .
	docker run -it --rm -v "${PWD}:/app" master-thesis rubber --pdf $(name).tex

nodocker:
	rubber --pdf $(name).tex

fold:
	fold -s thesis.tex > thesis.fold.tex
	mv thesis.fold.tex thesis.tex

spellcheck:
	aspell -t check thesis.tex

wordcount:
	@echo "Goal : between 12k and 16k"
	@pdftotext thesis.pdf - | tr -d '.' | wc -w

clean:
	docker run -it --rm -v "${PWD}:/app" master-thesis rubber --clean --pdf $(name).tex
