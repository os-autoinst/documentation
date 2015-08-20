main.pdf: main.tex
	@test -d o || mkdir o
	pdflatex -output-directory o $<
	pdflatex -output-directory o $<
	@mv o/$@ .

clean:
	rm -rf o *-eps-converted-to.pdf

.PHONY: clean
