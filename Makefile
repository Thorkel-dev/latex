SRC_PLANTUML = $(realpath ./schemas/)

DEPEND_PLANTUML = .temp/.dependPlantUML
OUTPUT_PLANTUML = $(SRC_PLANTUML)
SRC_FILES := $(wildcard $(SRC_PLANTUML)/*.plantuml) $(wildcard $(SRC_PLANTUML)/**/*.plantuml)

all: latex

eps : $(DEPEND_PLANTUML)
	@echo -e "\n================================================================================\n"
	@echo "                               Start to generate EPS file"
	@echo -e "\n================================================================================\n"
	@$(MAKE) $(patsubst $(SRC)/%.plantuml,$(OUTPUT)/%.$@,$(shell ls -1t $(SRC_FILES)))


$(OUTPUT)/%.eps: $(SRC)/%.plantuml
	plantuml -charset UTF-8 -teps -stdrpt:1 -recursive -teps $< -o $(OUTPUT)

$(DEPEND_PLANTUML): $(SRC_FILES)
	@find_includes() { \
		sed \
			-e "s,^[[:space:]]*!include \([^<].*[^>]\)$$,$${1}/\1," \
			-e t -e d "$$2" \
			| paste -sd " " -; \
	}; \
	echo "# GENERATED BY make depend" > $@; \
	echo "# DO NOT EDIT" >> $@; \
	echo >> $@; \
	for file in $^; do \
		name="$$(basename -s .plantuml "$$file")"; \
		includes="$$(find_includes "$(SRC_PLANTUML)" "$$file")"; \
		printf "$(OUTPUT)/%s.eps: %s\n" "$$name" "$$includes"; \
	done >> $@

latex:
	@echo -e "\n================================================================================\n"
	@echo "                               Start to generate PDF file"
	@echo -e "\n================================================================================\n"
	@latexmk

clean_eps:
	@rm -rf $(OUTPUT_PLANTUML)/**/*.eps $(OUTPUT_PLANTUML)/*.eps
	@rm -f $(DEPEND_PLANTUML)

clean_latex:
	@latexmk -c

clean_vscode:
	@rm -f *.toc *.out *.log *.lof *.ist *.glo *.fls *.fdb_latexmk *.aux *.acn *.synctex.gz *.pyg *.lol *.bcf *.xml *.acr *.alg *.bbl *.glg *.blg *.gls

clean: clean_eps clean_latex clean_vscode

.PHONY: all clean eps clean_eps latex clean_latex

-include $(DEPEND_PLANTUML)