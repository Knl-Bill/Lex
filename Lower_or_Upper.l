%{
#include <stdio.h>
int count=0;
%}
upper[A-Z]
lower[a-z]
text[a-zA-Z]
symbols" "|","|"."|"?"|"!"
%%
{lower}+{upper}+{text}*|{symbols} {continue;}
{upper}+{lower}+{text}* {continue;}
{lower}*|{upper}* {count++; printf("%d:%s\n",count,yytext);}
"\n" {printf("Total hits : %d\n",count); return 0;}
%%
int main()
{
	/*
		Counts the number of words that either have all lowercase or all uppercase letters
	*/
	yylex();
	return 0;
}
