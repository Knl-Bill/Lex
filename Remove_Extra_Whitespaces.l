%{
#include <stdio.h>
%}
%%
" "+ {printf(" ");}
\n {printf("\n"); return 0;}
%%
int main()
{
	yylex();
	return 0;
}
