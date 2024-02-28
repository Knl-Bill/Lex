%{
#include <stdio.h>
%}
%s START
%s ARG
%s END
%%
<INITIAL>"int " {BEGIN START;}
<INITIAL>. {printf("%s",yytext);}
<START>[a-zA-Z0-9]+ {printf("\n#define %s",yytext);}
<START>[(] {printf("%s",yytext); BEGIN ARG;}
<ARG>["(int " | "int "] {continue;}
<ARG>")" {printf("%s ",yytext); BEGIN END;}
<ARG>. {printf("%s",yytext);} 
<END>["{" | "return " | "\n" | "\t"] {continue;}
<END>[}] {printf("\n"); BEGIN INITIAL;}
<END>. {printf("%s",yytext);}
%%
int main()
{
yyin = fopen("lab4s2in.c","r");
yylex();
return 0;
}
int yywrap()
{
return 1;
}
