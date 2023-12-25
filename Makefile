VIRTUALENV ?= ~/.virtualenv

default: clean test

all: $(TARGETS)

clean: ## Clean all build files
	-@echo y | pip uninstall hack-python
	@rm -rdf hack_python.egg*
	@find . -name *.pyc -delete
	@rm -rdf build dist
	@rm -frd .pytest_cache .ruff_cache .coverage
	@rm -rfd __pycache__

.PHONY: test coverage help

test: ## Run all tests
	@pytest
	@ruff check .

coverage: ## Checks the coverage
	@coverage run -m pytest
	@coverage report -m 

dev: ## Install this package for development
	@pip install -e .
	@python -m pip install ruff
	@python -m pip install pytest
	@python -m pip install coverage

virtualenv: $(VIRTUALENV)/hack/bin/activate  ## create a virtualenv 'hack' for this project
	virtualenv $(VIRTUALENV)/hack

help: ## Shows help screen
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' Makefile | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-16s\033[0m %s\n", $$1, $$2}'
	@echo ""