%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
%}
%token ID NUM FOR LE GE EQ NE OR AND 
%right '='
%left '>' '<' LE GE EQ NE
%left '+' '-'
%left '*' '/'
%right UMINUS
%left '!'
%%
S:ST {printf("Input Accepted\n"); exit(0);}
ST: FOR '(' E ';' E2 ';' E3 ')' DEF;
DEF : '{' BODY '}' |E ';' | ST |;
BODY : BODY BODY |E ';' | ST |;
E: ID '=' E | E '+' E | E '-' E | E '*' E | E '/' E | E '>' E | E '<' E | E LE E | E GE E | E EQ E | E NE E | E OR E | E AND E | ID | NUM;
E2 : E '<' E | E '>' E | E OR E | E AND E | E LE E | E GE E | E EQ E | E NE E;
E3 : E '+' '+' | E '-' '-';
%%
#include "lex.yy.c"
int main()
{
	printf("Enter an expression : \n");
	yyparse();
	return 0;
}
