.PHONY: help book clean serve


# In the repo, SWDB content and JB support are intentionally separate
# First step in a build is to merge the two 
merge:
	@echo "Merging swdb/ and jupyter_book"
	mkdir _build/
	mkdir _build/input/
	cp -R jupyter_book/* _build/input/
	cp -R content/* _build/input/




# --------- Below here is jupyter-book 0.6.x stuff
install:
	jupyter-book install ./

book:
	jupyter-book build ./

runall:
	jupyter-book run ./content

clean:
	python scripts/clean.py

serve:
	bundle exec guard

build:
	jupyter-book build ./ 

site: build
	bundle exec jekyll build
	touch _site/.nojekyll

