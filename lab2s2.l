%{
#include <stdio.h>
int count=0;
%}
%%
[\t]+;
is|am|are|was|were {printf("'%s' ",yytext);}
. {continue;}
\n {printf("\nNumber of verbs : %d\n",count); return 0;}
%%
int main()
{
	yylex();
	return 0;
}
