%{
  #include "../build/parser.h"
%}

/* sets */
integers [0-9]

/* rules */
number ({integers})+

newLine \r|\n|\r\n
space  [ \t\f]|{newLine}

%%
";" {return SEMICOLON;}

"(" {return LEFTPAR;}
")" {return RIGHTPAR;}

"+" {return PLUS;}
"-" {return MINUS;}
"*" {return TIMES;}
"/" {return DIVISION;}

{number} {yylval = atoi(yytext); return INTEGER;}

{space} {}
%%