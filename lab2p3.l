%{
#include <stdio.h>
int count=0;
%}
%%
[A-Za-z] {continue;}
. {count++;}
\n {printf("Number of non alphabet characters : %d\n",count); return 0;}
%%
int main()
{
	yylex();
	return 0;
}
