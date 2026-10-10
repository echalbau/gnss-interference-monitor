PYTHON ?= python3.11
VENV := .venv
BIN := $(VENV)/bin

.PHONY: install lint format test

install:
	$(PYTHON) -m venv $(VENV)
	$(BIN)/pip install -e ".[dev,spark]"

lint:
	$(BIN)/ruff check .
	$(BIN)/ruff format --check .

format:
	$(BIN)/ruff check --fix .
	$(BIN)/ruff format .

test:
	$(BIN)/pytest
