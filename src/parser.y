%{
  #include <stdio.h>

  int yylex(void);
  void yyerror(char *);
%}

%token SEMICOLON
%token LEFTPAR RIGHTPAR
%token PLUS MINUS TIMES DIVISION
%token INTEGER

%start lines line
%start expr term factor

%%

lines: lines line
    | line

line: expr SEMICOLON

expr: expr PLUS term
    | expr MINUS term
    | term

term: term TIMES factor
    | term DIVISION factor
    | factor

factor: LEFTPAR expr RIGHTPAR
      | INTEGER

%%

int main(int argc, char **argv) {
  return yyparse();
}

void yyerror(char *msg) {
  fprintf(stderr, "Erro: %s\n", msg);
}
