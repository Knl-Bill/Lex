%{
%}
ALPHA [A-Za-z]
DIGIT [0-9]
%%
{ALPHA}({ALPHA}|{DIGIT})*        return ID;
{DIGIT}+ {yylval=atoi(yytext);       return NUM;}
[\n\t]                                             yyterminate();
.                                  return yytext[0];
%%
void yyerror(char * mes)
{
        puts(mes);
}

int yywrap()
{
return 1;
}
