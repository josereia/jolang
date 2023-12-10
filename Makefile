.PHONY: default install run build clean

default: run

APP_NAME=jolang

install:
	@echo "Installing dependencies"
	@sudo apt install make bison flex gcc build-essential

run:
	@echo "Running the application"
	@./build/${APP_NAME} < ./main.jo

build:
	@echo "Building the application"
	@mkdir -p build
	@flex -o  ./build/lexer.c ./src/lexer.l
	@bison -d -o ./build/parser.c ./src/parser.y
	@gcc -lfl -Wimplicit-function-declaration -o ./build/${APP_NAME} ./build/parser.c ./build/lexer.c

clean:
	@echo "Cleaning the application"
	@rm -rf ./build