%{
#include <stdio.h>
%}
%%
[\t]+;
is|am|are|were|was {printf("'%s' is a verb\n",yytext);}
. {continue;}
\n {return 0;}
%%
int main()
{
	yylex();
	return 0;
}
