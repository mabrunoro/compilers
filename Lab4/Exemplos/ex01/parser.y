
/* Options to bison */
// File name of generated parser.
%output "parser.c"
// Produces a 'parser.h'
%defines "parser.h"
// Give proper error messages when a syntax error is found.
%define parse.error verbose
// Enable LAC (lookahead correction) to improve syntax error handling.
%define parse.lac full

%{
#include <stdio.h>

int yylex(void);
void yyerror(char const *s);
%}

%token NUMBER PLUS ENTER

%%

line:
  expr ENTER
;

expr:
  expr PLUS expr
| NUMBER
;

%%

int main(void) {
  int result = yyparse();
  if (result == 0) printf("Parse successful!\n");
  else printf("Parse failed...\n");
}
