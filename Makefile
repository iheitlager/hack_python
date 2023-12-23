REPORTS ?= reports
DOCS ?= docs

default: clean test

all: $(TARGETS)

clean: ## Clean all build files
	-@echo y | pip uninstall hack-python

.PHONY: test dist docs version help

version: ## Show current version
	@python -c "import hack-python; print(hack-python.__version__)"

bandit: | $(REPORTS) ## Do bandit security check
	@bandit --ini ./.bandit -r ./src --format json -o $(REPORTS)/bandit.json

test: ## Run all tests
	@pytest

dist: ## Create a distribution
	@python setup.py sdist --formats=gztar bdist_wheel

dev: ## Install this package for development
	@pip install -e .

dev_env: ## Install the dev env
	@pip install pytest
