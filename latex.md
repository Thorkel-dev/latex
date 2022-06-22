# ToolRemotePairingBridge

![LaTeX](https://img.shields.io/badge/LaTeX-47A141?style=fflat&logo=LaTeX&logoColor=white)
<p>
<img alt="left face" align="left" src="https://eseo.fr/images/2018/logo-eseo-couleur-v2.png" height="75">
<img alt="right" align="right" src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/LOGO_Desoutter_WEB.gif/280px-LOGO_Desoutter_WEB.gif" height="75">
</p><br/><br/><br/><br/>

## Installation minimale

L'ensemble des documents du projet sont écrits en LateX.
Pour générer ces documents il est nécessaire d'installer LateX.
Voici une configuration minimale pour ce projet;

- Pour la génération des PlantUMLs en images:
  - Java, utilisation d'un .jar
  - Graphviz, génère un graph à partir d'une description textuelle de PlantUML
- Pour la génération des LaTeX en PDF:
  - latexmk, automatise les compilations
  - texlive-latex-base, contient des paquets qui sont mandatés par l'équipe principale de LaTeX
  - texlive-latex-extra, contient une très grande collection de paquets complémentaires
  - texlive-font-utils, pour la transformation et la manipulation d'image
  - texlive-lang-french, prise en charge du français

## Projet

L'ensemble des documents LateX suivent la même arborescence:

```text
├── figures/, images au format ``.png``, ``.jep``
├── ebauche/, fichier ``.tex``, ``.sty``
    ├── acronyms.tex
    ├── document.tex
    ├── glossary.tex
    └── tableauxVersion.tex
├── livrables/, fichier ``.pdf``
└── schemas/, fichier ``.plantuml`
```

Pour compiler le document LateX voulut il faut éxècuter la commande ``make`` dans le répertoire correspondant comme pour l'exemple suivant:

```text
└── specification
    ├── livrables
    ├── param/
    ├── sections/
    ├── dossierSpecification.tex
    ├── glossary.tex
    ├── Makefile
    └── tableauxVersion.tex
```

Un fichier au format ``.pdf`` est généré au même niveau que le ``Makefile``

## :interrobang: Erreurs

Le ``dossierSpecification.tex`` contient un glossaire, lors de la compilation LateX le module ``pdflatex`` créer des liens entre le glossaire et les entrées du glossaire du document. Pour cela il parcoure le document plusieurs fois, si nécessaire, et les énumère dans le fichier ``.aux``. Le nombre d'entrées du glossaire est trop important que ``pdflatex`` réussiss à toutes les énumérer dans sa limite max de passage, 5 par défaut, et il lui en faut plus, 7 environ. La gestion des dépendances du Makefile permet de gérer le problème en faisant un deuxième make.

- [x] TODO :
  - Augmenter le nombre de passage max de pdflatex (``$max_repeat=7`` ?) dans les options de compilation du Makefile pour LateX
- [ ] ou
  - Passer par un fichier ``latexmk`` pour modifier plus facilement l'option ``$max_repeat=7``

L'image utilisée par le pipeline ne possède pas texlive-full et oblige à ajouter des packages pour correspondre à l'installation minimale du projet.

- [ ] TODO :
  - Cette même image peut avoir un texlive-full via le tag ``:full`` mais le runner GitLab ne parvient pas à pull l'image à cause des règles mise en place.
- [x] ou
  - Sauvegarder une image custom pour le projet directement dans le GitLab.

Le PDF de ``dossierSpecification.tex`` est incomplet. Le glossaire n'est pas généré car ne trouvant pas certaines références, les diagrammes PlantUML ne supportent pas les accents. Ce ne sont pas des erreurs détectées dans le scrip du pipeline. Le job est validé malgré ces erreurs (erreurs non présentes localement).

- [x] TODO:
  - Investiguer sur ces erreurs.
