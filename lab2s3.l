%{
#include <stdio.h>
int count=0;
%}
%%
[A-Za-z0-9] {continue;}
. {count++;}
\n {printf("Number of whitespaces : %d\n",count); return 0;}
%%
int main()
{
	yylex();
	return 0;
}
