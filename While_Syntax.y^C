%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
%}
%token ID NUM WHILE LE GE EQ NE OR AND 
%right '='
%left '>' '<' LE GE EQ NE
%left '+' '-'
%left '*' '/'
%right UMINUS
%left '!'
%%
S: ST { printf("Input Accepted\n"); exit(0); };
ST: WHILE '(' E ')' DEF;
DEF: '{' BODY '}' | E ';' | ST | ;
BODY: BODY BODY | E ';' | ST | ;
E: E '<' E | E '>' E | E OR E | E AND E | E LE E | E GE E | E EQ E | E NE E | ID | NUM ;
%%
#include "lex.yy.c"
int main() {
    printf("Enter an expression : \n");
    yyparse();
    return 0;
}

