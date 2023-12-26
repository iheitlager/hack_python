
.ONESHELL:
SHELL := /bin/bash

VIRTUALENV = ./.hack
PYTHON = $(VIRTUALENV)/bin/python
.PHONY: test lint coverage help

default: clean env test

all: $(TARGETS)

clean: ## Clean all build files
	-@echo y | pip uninstall hack-python
	@rm -rdf hack_python.egg*
	@find . -name *.pyc -delete
	@rm -rdf build dist
	@rm -rdf $(VIRTUALENV)
	@rm -frd .pytest_cache .ruff_cache .coverage
	@rm -rfd __pycache__

dev:$(VIRTUALENV)/bin/python  ## Install this for development
	@$(PYTHON) -m pip install --upgrade pip
	@$(PYTHON) -m pip install -e .
	@$(PYTHON) -m pip install ruff
	@$(PYTHON) -m pip install pytest
	@$(PYTHON) -m pip install coverage

test:  ## Run all tests
	@pytest

lint: test ## Static code checking
	@ruff check .

coverage: ## Code coverage
	@coverage run -m pytest
	@coverage report -m 

$(VIRTUALENV)/bin/python: # create the local virtualenv
	virtualenv $(VIRTUALENV)
	echo "To activate 'source $(VIRTUALENV)/bin/activate'"

help: ## Shows help screen
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' Makefile | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-16s\033[0m %s\n", $$1, $$2}'
	@echo ""