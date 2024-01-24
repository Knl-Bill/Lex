%{
#include <stdio.h>
int count=0;
%}
%%
" "+[A-SU-Za-su-z]*+[T|t]+[A-SU-Za-su-z]*+[T|t]+[A-SU-Za-su-z]*+[T|t]+[A-SU-Za-su-z]*+" " {count++; printf("'%s' ",yytext);}
[A-SU-Za-su-z]*+[T|t]+[A-SU-Za-su-z]*+[T|t]+[A-SU-Za-su-z]*+[T|t]+[A-SU-Za-su-z]*+" " {count++; printf("'%s' ",yytext);}
" "+[A-SU-Za-su-z]*+[T|t]+[A-SU-Za-su-z]*+[T|t]+[A-SU-Za-su-z]*+[T|t]+[A-SU-Za-su-z]* {count++; printf("'%s' ",yytext);}
. {continue;}
\n {printf("Number of words with 3 t's in it : %d\n",count); return 0;}
%%
int main()
{
	yylex();
	return 0;
}
