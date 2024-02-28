%{
#include <stdio.h> 
#include <string.h>
int i;
char var;
%}
text [a-zA-Z]
num [0-9]
%s START
%s CONDN
%s BODY
%s NEXT
%s END
%%
"switch(" {BEGIN START;}
<START>[":" | "{" | "}"] {continue;}
<START>{text} {var = yytext[0]; BEGIN CONDN;}
<CONDN>[a-zA-Z] {continue;}
<CONDN>[0-9] {printf("if(%c == %s)\n",var,yytext); BEGIN BODY;}
<CONDN>. {continue;}
<BODY>"}" {printf("%s",yytext); BEGIN NEXT;}
<BODY>":" {continue;}
<BODY>. {printf("%s",yytext);}
<NEXT>"default" {printf("else\n"); BEGIN BODY;}
<NEXT>{num}+ {printf("else if(%c == %s)\n",var,yytext); BEGIN BODY;}
<NEXT>. {continue;}
%%
int main()
{
yyin = fopen("switch.c","r");
yylex();
fclose(yyin);
return 0;
}
int yywrap()
{
return 1;
}
