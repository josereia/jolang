.PHONY: default install run build clean

default: run

APP_NAME := jolang

install:
	@echo "Installing dependencies"
	@sudo apt install make bison flex gcc build-essential

run:
	@echo "Running the application"
	@./build/${APP_NAME} < ./main.jo

build:
	@echo "Building the application"
	@mkdir -p build
	@lex -o ./build/lexer.c ./src/lexer.l
	@yacc -d -o ./build/parser.c ./src/parser.y 
	@g++ -lfl -o ./build/${APP_NAME} ./build/parser.c

clean:
	@echo "Cleaning the application"
	@rm -rf ./build