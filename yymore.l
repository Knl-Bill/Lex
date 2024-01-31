%{
#include <stdio.h>
int flag=0;
%}
text [a-z]
num [0-9]
%%
{text}+ {yymore();}
{num}+ {printf("%s\n",yytext);}
. ;
"\n" {return 0;}
%%
int main()
{
	yylex();
	return 0;
}
