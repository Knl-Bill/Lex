%{
#include <stdio.h>
int count=0;
%}
vowel[aeiouAEIOU]
cons[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z]
text[a-zA-Z]
%%
{cons}*{vowel}{cons}*{vowel}{text}* { count++; printf("%d:%s\n",count,yytext);}
" " {continue;}
{text}*|"?"|","|"."|"!" { continue; }
"\n" {printf("Total hit : %d\n",count); return 0;}
%%
int main()
{
	/*
		the lex program counts the number of words having atleast 2 vowels (vowels >=2 )
	*/
	yylex();
	return 0;
}
