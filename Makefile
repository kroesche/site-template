# SPDX-License-Identifier: MIT
#
# MIT License
#
# Copyright (c) 2024 Joseph Kroesche
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# web facing path
SITE_URL=https://site-domain.tld
SITE_PATH=site-path

# SSH for rsync deploy
SSH_PORT=18301
SSH_USER=webhost-username
SSH_HOST=webhost-domain.tld
SSH_PATH=webhost-internal-path/$(SITE_PATH)

# linkchecker site credentials, uncomment if needed
#LINKCHECKER_CREDS=--user site-username --password

# if you want a pinned version of nodeenv, uncomment and specify
#NODEENV_VER="==1.9.1"

all: build

.PHONY: help
help:
	@echo ""
	@echo "-------------"
	@echo "Makefile help"
	@echo "-------------"
	@echo ""
	@echo "build       - generate site files"
	@echo "serve       - development server"
	@echo "clean       - clean generated files"
	@echo "deploy      - rsync to web site"
	@echo "linkchecker - check links on deployed site"
	@echo "spell       - run spell checker"
	@echo "nonascii    - find files with non-ascii characters"
	@echo "minify      - run minifier on css, js, and html site files"
	@echo ""
	@echo "venv        - create python virtual environment (automatic when needed)"
	@echo "cleanvenv   - clean the python venv"
	@echo "audit       - run python package checker (automatic when needed)"
	@echo "requirements- generate updated requirements file"
	@echo ""

.PHONY: build
build: |venv
	venv/bin/mkdocs build

.PHONY: minify
minify: venv/bin/nodeenv build |venv
	mkdir -p purgecss
	. venv/bin/activate; purgecss --css site/css/bootstrap.min.css --content site/**/*.html --output purgecss
	. venv/bin/activate; purgecss --css site/css/fontawesome.min.css --content site/**/*.html --output purgecss
	. venv/bin/activate; purgecss --css site/css/brands.min.css --content site/**/*.html --output purgecss
	cp purgecss/bootstrap.min.css site/css/.
	cp purgecss/fontawesome.min.css site/css/.
	cp purgecss/brands.min.css site/css/.

.PHONY: clean
clean:
	rm -rf site
	rm -rf purgecss

.PHONY: serve
serve: |venv
	venv/bin/mkdocs serve --dirty

.PHONY: deploy
deploy: build
	rm -f site/js/*.map
	rsync -e "ssh -p $(SSH_PORT)" -P -rvzc --delete site/ $(SSH_USER)@$(SSH_HOST):$(SSH_PATH) --cvs-exclude --exclude=/.well-known --exclude=/.htaccess

# scan (deployed) site for broken links
.PHONY: linkchecker
linkchecker: venv
	venv/bin/linkchecker $(LINKCHECKER_CREDS) --no-robots $(SITE_URL)/$(SITE_PATH)/

# run aspell over all the markdown files and print any unknown words. This will
# need to be used iteratively, adding legitimate words that are not recognized
# to wordlist.txt
.PHONY: spell
spell:
	@if ! command -v aspell 2>&1 >/dev/null; \
	then \
	  echo "you must have aspell installed to perform a spell check"; \
	  exit 1; \
	fi; \
	for md in docs/*.md; do \
	  echo ""; \
	  echo "*** File: $$md ***"; \
	  cat $$md | sed "s/[0-9]th//g" | sed "s/\(.*\){:.*//" |  aspell list --mode=markdown -d en_US -p $$PWD/wordlist.txt --encoding utf-8; \
	done

# scan markdown files for non-ascii characters
.PHONY: nonascii
nonascii: |venv
	cd docs; ../venv/bin/python3 ../nonascii.py *.md

########################################
# PYTHON VIRTUAL ENVIRONMENT MAINTENANCE
########################################

venv: venv/bin/activate

venv/bin/activate: requirements.txt
	test -d venv || python3 -m venv venv
	venv/bin/python -m pip install -U pip setuptools wheel
	venv/bin/python -m pip install -U pip-audit
	venv/bin/python -m pip install --no-deps -r $<
	touch $@
	-venv/bin/pip-audit

# install nodeenv on demand
venv/bin/nodeenv: |venv
	venv/bin/python -m pip install nodeenv$(NODEENV_VER)
	venv/bin/nodeenv -p
	. venv/bin/activate; npm install -g purgecss

.PHONY: requirements
requirements:
	rm -rf venv
	python3 -m venv venv
	venv/bin/python -m pip install -U pip setuptools wheel
	venv/bin/python -m pip install -Ur requirements.in
	venv/bin/python -m pip freeze > requirements.txt

.PHONY: cleanvenv
cleanvenv:
	rm -rf venv

.PHONY: audit
audit: |venv
	venv/bin/pip-audit

# NOTES about nodeenv
# the minify target requires node, so nodeenv is used as an attempt to sandbox
# a node environment to our local project
#
# If 'minify' target is used then node gets installed this way. If you dont
# use minify, then node is not needed. If a specific nodeenv version is needed
# uncomment the version line at the top of this file.
#
# npm security, versioning, and package pinning not covered here but should be
# considered.
