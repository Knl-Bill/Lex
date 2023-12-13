%{
#include <stdio.h>
int count=0;
%}
symbols" "|","|"?"|"."|"!"
%%
[a-jl-zA-JL-Z]+[kK] {count++; printf("%d:%s\n",count,yytext);}
[a-zA-Z]+[a-jl-zA-JL-Z] {continue;}
{symbols} {continue;}
"\n" {printf("Total hits : %d\n",count); return 0;} 
%%
int main()
{
	/*
		The lex program calculates the number of words that end with 'k' or 'K'
	*/
	yylex();
	return 0;
}
