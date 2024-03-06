alpha[a-zA-Z]
digit[0-9]
%%
[\t\n]
"for" return FOR;
{digit}+ return NUM;
{alpha}({alpha}|{digit})* return ID;
"<=" return LE;
">=" return GE;
"==" return EQ;
"!=" return NE;
"||" return OR;
"&&" return AND;
. return yytext[0];
%%
void yyerror(char *mes)
{
	puts(mes);
}
int yywrap()
{
	return 1;
}
