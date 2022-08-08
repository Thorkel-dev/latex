# Latex

![LaTeX](https://img.shields.io/badge/LaTeX-47A141?style=fflat&logo=LaTeX&logoColor=white)

## Installation minimale

L'ensemble des documents du projet sont écrits en LaTeX.
Pour générer ces documents, il est nécessaire d'installer LaTeX.
Voici une configuration minimale pour ce projet ;

- Pour la génération des PlantUMLs en images :
  - Java, utilisation d'un .jar
  - Graphviz, génère un graph à partir d'une description textuelle de PlantUML
- Pour la génération des LaTeX en PDF :
  - latexmk, automatise les compilations
  - texlive-latex-base, contient des paquets qui sont mandatés par l'équipe principale de LaTeX
  - texlive-latex-extra, contient une très grande collection de paquets complémentaires
  - texlive-font-utils, pour la transformation et la manipulation d'image
  - texlive-lang-french, prise en charge du français
  - biber, bibliographiques pour LaTeX
  - texlive-bibtex-extra, ajout de différent style pour BibLaTeX
  - pygments, un surligneur syntaxique générique adapté à l'hébergement de code
  - plantuml, composant qui permet de dessiner rapidement des diagramme

## Projet

L'ensemble des documents LaTeX suivent la même arborescence :

```text
├── figures/, images au format ``.png``, ``.jep``
├── ebauche/
    ├── param/
    |   ├── frontPage.tex
    |   └── parameter.tex
    ├── acronyms.tex
    ├── document.tex
    ├── glossary.tex
    ├── Makefile
    └── tableauxVersion.tex
├── livrables/, fichier ``.pdf``
└── schemas/, fichier ``.plantuml`
```

Pour compiler le document LaTeX voulut, il faut exécuter la commande ``make`` dans le répertoire correspondant comme pour l'exemple suivant :

Un fichier au format ``.pdf`` est généré au même niveau que le ``Makefile``.
