# Master Thesis Report
## Recovering type information from compiled binaries to aid in instrumentation
##### Spring 2021
##### Louis Merlin

[Read it here](https://github.com/louismerlin/master-thesis/releases/download/submitted/thesis.pdf)


# Acknowledgement

This thesis was created using [HexHive's thesis template](https://github.com/HexHive/thesis_template).


# Prerequisites

Make sure you have the necessary LaTeX packages installed. For Ubuntu/Debian,
the installation instructions are as follows:

```
sudo apt install make texlive-base texlive-bibtex-extra texlive-latex-base \
                 texlive-latex-extra texlive-latex-recommended \
                 texlive-science texlive-lang-german texlive-lang-french \
                 texlive-bibtex-extra biber rubber
```


# Editing

You will edit the files `thesis.tex` (this is where you write your report) 
and `thesis.bib` (this is where you add all your references). Add figures in
a `./figures` directory. To create the PDF of your thesis, run `make`.


# Writing Tips

Writing is hard. Here, have some help.


## I. Punctuation

1. Use the Oxford comma for enumerations: We talk about a, b, and c (see the
   comma before and)
2. We use commas around e.g. and i.e.: foo, e.g., or, i.e., bar
3. `This is a sentence with a footnote\footnote{In the footnote we use a full
   sentence as well.}.`


## II. Weasel words and bad writing

1. Never use "is able to", "is not able to". These expressions can always be
   removed
2. Don't use passive voice (or minimize passive voice as much as possible)
3. Don't use abbreviations (no don't won't it's) in a paper
4. Don't use [weasel words](https://en.wikipedia.org/wiki/Weasel_word)
   (Up to sixty percent, Clearly, The vast majority)
5. Run a spell check and grammar check on the document before every commit
6. Don't use **Discuss about** 
   [link](https://english.stackexchange.com/questions/146833/is-discuss-about-grammatically-incorrect)
7. For the "Related Work" section, use consistency. Always cite the work after
   introducing the name
8. Always add a space after parentheses "foo (bar)", not "foo(bar)", this is
   not a function call!
9. Be careful about the correct spelling of benchmark and other systems:
   SPEC CPU2006


## III. LaTeX do's and don'ts

1. Use `\autoref` not `\ref` when referring to a section. When you refer to a
   specific section add `label{sec:mysec}` and then refer to it as
   `\autoref{sec:mysec}`. LaTeX will turn this into, e.g., `Section 2`.
   Same goes for Figures, Tables, or Listings.
2. Use a non-breaking space (`\~`) before, e.g., `\cite (foo\~\cite{bar})`, 
   `\autoref` as in `foo\~\autoref{fig:foo}`; don't use a breaking space ` `
   before a non-breaking space as this defeats the purpose of non-breaking
   spaces. Do not use non-breaking spaces for free standing text such as
   `XXX. \autoref{fig:foo} shows...`.
3. For providing inline comments while iterating over the paper, 
   you can use the `todonotes` LaTex package. This allows for turning off the
   comments using a simple disable flag. Sample provided below:
   ```latex
    \usepackage[disable]{todonotes} %disables all todonotes
    \newcommand{\ali}[1]{\todo[inline,color=red!40]{alice: #1}} % inline comment block
   ```
4. Use \emph while introducing keywords and for proper nouns, e.g.,
   `\emph{Control-Flow Integrity} (CF)`


## IV. Paper writing

1. Start with an outline of the paper
2. For each section/subsection outline each paragraph and what you want to
   say. Keep this information as comment above the paragraphs
3. Continue to expand (write text for the individual paragraphs) and compact
   (condense the text to remove fluff), then expand again to figure out a
   better wording.
4. Figures are important, each major concept should be described through a
   self-explaining Figure; take care of reasonable captions!
5. Tables and graphs are important too, take care to show the advantages of
   your system; make sure the captions are helpful!
6. Goal: someone reading just the outline and looking at the Figures/Graphs
   should get a good idea what the paper is about.


## V. Benchmarking

1. Always use all programs in a benchmark set, report the full performance
   overhead
2. Memory overhead may be important too
3. For figures: show the baseline, start x/y axis at 0, show label axes
4. When presenting results in a table: (i) right align numbers, left align
   text, (ii) use commas as delimeter for large numbers: 1,000,000; not
   1000000, (iii) label your columns/rows, (iv) the caption should explain any
   abbreviations, (v) the table must be referenced in text, explaining the
   main take-away but not just repeating results.


## VI. Discussing Related Work

Think who is the most likely expert reviewer of your paper. How critically
should you discuss their work? Orthogonally, their work is already published
and contributed to the field. Always talk about related work in a positive
way. Highlight the positive aspects when you introduce related work, then
iterate over why your work is different.

Foo et al. introduced the first zero-overhead CFI instrumentation based on an
optimized set `check\~\cite{FoosWork}`. While `\sysname` leverages a similar
runtime check, it combines a static analysis with a dynamic modification
scheme that allows on-the-fly adjustments of target sets while Foo's target
sets were purely static.

## VII. Repositories and Linting

Note that these are hard rules that we will enforce in the group :)

* Push your code to a git repository, add a link to this repository in your
  slack channel and/or in the wiki of the project
* Add a `Makefile` that builds the paper with `rubber` (or `pdflatex`).
  The repository contains an example `Makefile`.
* Always use vector images, never rasterize (i.e., no JPG/PNG but rather
  export to PDF then embed PDF)
* The full text of the paper is in a single file for easier editing/searching
  (the repository will take care of merging)
* Break lines at 80 characters
