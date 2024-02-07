%{
#include <stdio.h>
int i;
%}
text [a-z,;\%"()]
num [0-9]
%s START
%s CONDN
%s BODY
%s NEXT
nl [\n]
%%
"if(" {BEGIN START;}
<START>{text}+ {printf("switch(%s)",yytext);
printf("\n{");
BEGIN CONDN;}
<CONDN>"=="{num}+ {printf("\ncase ");
for(i=2;i<yyleng;i++)
{
printf("%c",yytext[i]);
}
printf(":\n");
BEGIN BODY;
}
<BODY>"{"{nl}.* {for(i=1;i<yyleng;i++)
{
printf("%c",yytext[i]);
}
BEGIN NEXT;
}
<NEXT>"}"{nl}"else if("{text}+ {printf("\nbreak;");
BEGIN CONDN;}
<NEXT>"}"{nl}"else" {printf("\nbreak;");
printf("\ndefault:\n");
BEGIN BODY;
}
<NEXT>"}" {printf("\n}");}
. ;
%%
int main()
{
yyin=fopen("lab4p2in.c","r");
yylex();
fclose(yyin);
return 0;
}
int yywrap()
{
return 1;
}
