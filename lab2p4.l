%{
#include <stdio.h>
int count=0;
%}
%%
" " {count++;}
. {continue;}
\n {printf("Number of whitespace characters : %d\n",count); return 0;}
%%
int main()
{
	yylex();
	return 0;
}
