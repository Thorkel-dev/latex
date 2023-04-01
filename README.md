# Latex

![LaTeX](https://img.shields.io/badge/LaTeX-47A141?style=fflat&logo=LaTeX&logoColor=white)

## Minimum installation

All the documents of the project are written in LaTeX.
To generate these documents, it is necessary to install LaTeX.
Here is a minimal configuration for this project;

- For the generation of the PlantUMLs in :
  - PlantUML, component that allows to draw quickly diagrams
  - Graphviz, generates a graph from a textual description of PlantUML
- For the generation of LaTeX in PDF :
  - latexmk, automates compilations
  - texlive-latex-base, contains packages that are mandated by the main LaTeX team
  - texlive-latex-extra, contains a very large collection of additional packages
  - texlive-font-tools, for image transformation and manipulation
  - texlive-lang-french, French language support
  - biber, bibliography for LaTeX
  - texlive-bibtex-extra, adding different styles for BibLaTeX
  - pygments, a generic syntax highlighter adapted to code hosting

## Project

All LaTeX documents follow the same tree structure:

```text
├── figures/, images in ``.png``, ``.jep`` format
├── param/
|   ├── frontPage.sty
|   └── parameter.sty
├── schemas/, file ``.plantuml``
├── sections/, file ``.tex``
├── acronyms.tex
├── document.tex
├── glossary.tex
├── Makefile
└── tablesVersion.tex
```

To compile the desired LaTeX document, you need to run the command ``make`` in the corresponding
directory.

A .pdf file is generated at the same level as the makefile.
