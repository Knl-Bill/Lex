%{
#include <stdio.h>
int count=0;
%}
upper[A-Z]
lower[a-z]
text[a-zA-Z]
symbols " "|","|"?"|"!"|"."
%%
[a-z]|[A-Z] {continue;}
{lower}+{upper}+{text}* {count++; printf("%d:%s\n",count,yytext);}
{upper}+{lower}+{text}* {count++; printf("%d:%s\n",count,yytext);}
{symbols} {continue;}
"\n" { printf("Total hits : %d\n",count); return 0;}
%%
int main()
{
	/*
		Words having both, the upper and the lower case letters.
	*/
	yylex();
	return 0;
}
