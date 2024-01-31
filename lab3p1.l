%{
#include <stdio.h>
%}
text[a-z]
%%
{text}+ {
	yyless(4); 
	printf("%s\n",yytext);
}
. ;
%%
int main()
{
	yylex();
	return 0;
}
