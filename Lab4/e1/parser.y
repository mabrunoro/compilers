
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

%token NUMBER HNUMBER
%left '+' '-'  /* Ops associativos a esquerda. */
%left '*' '/'  /* Mais para baixo, maior precedencia. */

%%
lines: %empty
| lines expr '\n'       { printf(">> %d\n", $2); } ;
expr: NUMBER
| HNUMBER
| expr '+' expr         { $$ = $1 + $3; }
| expr '-' expr         { $$ = $1 - $3; }
| expr '*' expr         { $$ = $1 * $3; }
| expr '/' expr         { $$ = $1 / $3; } ;
%%
