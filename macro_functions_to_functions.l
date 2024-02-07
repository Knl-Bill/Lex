%{
#include <stdio.h>
int i=0,j=0,k=0,arg[10][20],mname[20];
%}
%s START
%s ARG
%s END
%%
<INITIAL>"#define " {BEGIN START;}
<INITIAL>. {printf("%s",yytext);}
<START>[a-zA-Z0-9]+ {
printf("\nint %s",yytext);
}
<START>[(] {printf("%s",yytext);
BEGIN ARG;
}
<ARG>[^,()] {
printf("int %s ",yytext);
}
<ARG>[,] {printf("%s",yytext);}
<ARG>")" {printf("%s\n{",yytext);
BEGIN END;
}
<END>[^\n]+ {
printf("\nreturn %s\n}\n",yytext);
BEGIN INITIAL;
}
%%
int main()
{
yyin=fopen("input.c","r");
yylex();
return 0;
}
int yywrap()
{
return 1;
}
