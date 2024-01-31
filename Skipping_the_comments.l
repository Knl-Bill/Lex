%{
#include <stdio.h>
int flag=0;
int skipcmds();
%}
text [a-zA-Z]
%%
"/*" skipcmds();
. {printf("%s",yytext);}
%%
int skipcmds()
{
	for(;;)
	{
		while(input() != '*');
		if(input() != '/')
		{
			unput(yyleng-1);
		}
		else
		{
			return 0;
		}
	}
}
int main()
{
	yyin = fopen("lab3p3.txt","r");
	yylex();
}
int yywrap()
{
	return 1;
}
