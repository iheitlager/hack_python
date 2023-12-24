VIRTUALENV ?= ~/.virtualenv

default: clean test

all: $(TARGETS)

clean: ## Clean all build files
	-@echo y | pip uninstall hack-python
	@find . -name *.pyc -delete
	@rm -rf build hack-python.egg* dist

.PHONY: test help

test: ## Run all tests
	@pytest

dev: ## Install this package for development
	@pip install -e .

dev_env: ## Install the dev env
	@pip install pytest

virtualenv: $(VIRTUALENV)/hack/bin/activate  ## create a virtualenv 'hack' for this project
	virtualenv $(VIRTUALENV)/hack

help: ## Shows help screen
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' Makefile | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-16s\033[0m %s\n", $$1, $$2}'
	@echo ""