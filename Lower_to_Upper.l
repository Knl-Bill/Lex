%{
#include <stdio.h>
%}
%%
[a-z] {printf("%c",yytext[0]-32);}
"\n" {printf("\n"); return 0;}
%%
int main()
{
	/*
		The Lex program converts the lowercase characters to Uppercase
	*/
	yylex();
	return 0;
}
