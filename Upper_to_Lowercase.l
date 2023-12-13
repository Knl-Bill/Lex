%{
#include <stdio.h>
%}
symbols" "|","|"."|"?"|"!"
%%
[A-Z] {printf("%c",yytext[0]+32);}
"\n" {printf("\n"); return 0;}
%%
int main()
{
	/*
		Converts the Uppercase letters to Lowercase
	*/
	yylex();
	return 0;
}

