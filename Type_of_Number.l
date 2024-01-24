%{
#include <stdio.h>
%}
%%
[0-9]+"."+[0-9]* {printf("Decimal number\n");}
[0-9]* {printf("Whole number\n");}
\n {continue;}
"exit" {return 0;}
%%
int main()
{
	yylex();
	return 0;
}
