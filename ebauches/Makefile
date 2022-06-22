PAPER= document.tex  # set the path to your TeX file here
SRC_PLANTUML = $(realpath ../schemas/)

PLANTUML = ../plantuml.jar
DEPEND_LATEX = .dependLatex
OUTPUT_LATEX = ./build
OUTPUT_PLANTUML = $(SRC_PLANTUML)
SRC_FILES := $(wildcard $(SRC_PLANTUML)/*.plantuml) $(wildcard $(SRC_PLANTUML)/**/*.plantuml)

all: eps latex

eps:
	java -jar $(PLANTUML) -charset UTF-8 -teps -stdrpt:1 -recursive $(SRC_FILES)

latex: ## Compile paper
	@latexmk -e '$$max_repeat=10' -time --shell-escape -auxdir=$(OUTPUT_LATEX) -output-directory=$(OUTPUT_LATEX) -pdf -deps -deps-out=$(DEPEND_LATEX) $(PAPER)
	@cd $(OUTPUT_LATEX) && makeglossaries document && cd ../
	@latexmk -e '$$max_repeat=10' -time --shell-escape -auxdir=$(OUTPUT_LATEX) -output-directory=$(OUTPUT_LATEX) -pdf -deps -deps-out=$(DEPEND_LATEX) $(PAPER)
	@mv build/*.pdf ./

clean_eps:
	@rm -rf $(OUTPUT_PLANTUML)/**/*.eps $(OUTPUT_PLANTUML)/**/*.pdf

clean_latex:
	@rm -rf $(OUTPUT_LATEX) $(DEPEND_LATEX)

clean_vscode:
	@rm -f *.toc *.out *.log *.lof *.ist *.glo *.fls *.fdb_latexmk *.aux *.acn *.synctex.gz

clean: clean_eps clean_latex clean_vscode ## Clean output files

.PHONY: all clean eps clean_eps latex clean_latex

-include $(DEPEND_LATEX)
