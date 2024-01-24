%{
#include <stdio.h>
int count=0;
%}
%%
[A-Za-z0-9]|[" "] {continue;}
. {count++; printf("'%s' ",yytext);}
\n {printf("\nNumber of special characters : %d\n",count); return 0;}
%%
int main()
{
	yylex();
	return 0;
}
