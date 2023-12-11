%{
  #include <iostream>
  #include <string>
  #include <any>
  #include <sstream>
  #include <typeinfo>

  #include "../src/core/core.hpp"
  #include "../src/modules/math_module.hpp"

  #include "../src/core/factory.cpp"
  #include "../src/core/visitor.cpp"

  using namespace std;
  using namespace Core;
  using namespace Math;

  extern "C" int yylex(void);
  void yyerror(string);

  IFactory* factory = new Factory();
  IVisitor* visitor = new Visitor();
%}

%union {
  int integer;
  IExpression* expression;

  YYSTYPE() : integer(0) {}
  YYSTYPE(int v) : integer(v) {}
}

%token SEMICOLON
%token LEFTPAR RIGHTPAR
%token PLUS MINUS TIMES DIVISION
%token <integer> INTEGER

%start lines
%type <expression> final_expr expr term factor

%%

lines: lines final_expr
    | final_expr

final_expr: expr SEMICOLON { $1->accept(visitor); };

expr: expr PLUS term { $$ = factory->binaryOp(PLUS, $1, $3); }
    | expr MINUS term { $$ = factory->binaryOp(MINUS, $1, $3); }
    | term { $$ = $1; };

term: term TIMES factor { $$ = factory->binaryOp(TIMES, $1, $3); }
    | term DIVISION factor { $$ = factory->binaryOp(DIVISION, $1, $3); }
    | factor { $$ = $1; };

factor: LEFTPAR expr RIGHTPAR { $$ = $2; }
      | INTEGER { $$ = factory->integer($1); };

%%

#include "../build/lexer.c"

int yyparse();

int main(int argc, char* argv[]) {
  return yyparse();
}

void yyerror(string msg) {
  cout << msg << endl;
	exit (0);
}
