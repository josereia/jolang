.PHONY: default install run build

default: run

install:
	@echo "Installing dependencies"
	@sudo apt install make bison flex gcc build-essential

run:
	@echo "Running the application"

build:
	@echo "Building the application"
