%{
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
char str1[10]="while(";
char str2[1024];
char str3[10];
int i,j,k;
%}
rop ("<"|">"|">="|"<="|"!="|"==")
var [a-z]
value [0-9]
inc ("++"|"--")
%%
. ;
\n ;
"for(" ;
{var}+"="{value}+(","{var}+"="{value})*";" {fprintf(yyout,"%s\n",yytext); printf("%s\n",yytext);}
{var}+{rop}{value}+";" {for(i=0;i<yyleng-1;i++)
{
str3[i]=yytext[i];
}
strcat(str1,str3);
strcat(str1,")");
printf("%s\n",str1);
fprintf(yyout,"%s",str1);
fprintf(yyout,"\n");
strcpy(str1,"while(");
}
{var}+{inc}")" {for(k=0;k<yyleng-1;k++)
{
str2[k]=yytext[k];
}
str2[k]=';';
}
{var}+{inc}");" {for(k=0;k<yyleng-2;k++)
{
str2[k]=yytext[k];
}
str2[k]=';';
fprintf(yyout,"{%s}\n",str2);
}
"{"[\n]?.*[\n]?"}" {for(j=0;j<yyleng-1;j++)
{
fprintf(yyout,"%c",yytext[j]);
}
fprintf(yyout,"%s\n",str2);
strcpy(str2,"");
fprintf(yyout,"}\n");
}
"for(;;)" {fprintf(yyout,"while(1);");}
%%
int main()
{
yyin=fopen("lab4p1in.c","r");
yyout=fopen("lab4p1out.c","w");
yylex();
return 0;
}
int yywrap()
{
return 1;
}
