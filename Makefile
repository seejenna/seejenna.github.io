TECTONIC ?= tectonic
RESUME_SOURCE := resume/Zijian_Qin_Resume.tex
RESUME_OUTPUT_DIR := files
RESUME_PDF := $(RESUME_OUTPUT_DIR)/Zijian_Qin_Resume.pdf

.PHONY: resume resume-preview

resume:
	$(TECTONIC) -X compile $(RESUME_SOURCE) --outdir $(RESUME_OUTPUT_DIR)

resume-preview: resume
	@if command -v code >/dev/null 2>&1; then \
		code $(RESUME_PDF); \
	elif command -v open >/dev/null 2>&1; then \
		open $(RESUME_PDF); \
	elif command -v xdg-open >/dev/null 2>&1; then \
		xdg-open $(RESUME_PDF); \
	else \
		echo "Resume built at $(RESUME_PDF)"; \
	fi
