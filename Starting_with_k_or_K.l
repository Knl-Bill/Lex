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
	/*
		The code is a lex program to count the number of words in the input that start with a 'k' or 'K'.
	/*
	yylex();
	return 0;
}

