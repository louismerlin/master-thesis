name=thesis

all: build *.tex *.bib
	@docker run -it --rm \
		-u $$(id -u):$$(id -g) \
		-v "${PWD}:/app" \
		-v "${PWD}/.texlive2018:/root/.texlive2018" \
		master-thesis \
		rubber --pdf $(name).tex
 
build: Dockerfile
	docker build -t master-thesis .

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

clean: build
	docker run -it --rm -v "${PWD}:/app" master-thesis rubber --clean --pdf $(name).tex

