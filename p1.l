%{
#include <stdio.h>
int count=0;
%}
%%
" "+[a-jA-J][l-zL-Z]+[kK]*+[a-zA-Z]*+" " { continue; }
[kK][a-zA-Z]* { count++; printf("%d:%s\n",count,yytext); }
"\n" { printf("Total hits : %d\n",count); return 0;}
%%
int main()
{
	yylex();
	return 0;
}

