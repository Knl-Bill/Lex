%{
#include <stdio.h>
#include <stdlib.h>
%}
%token ID NUM FOR LE GE EQ NE OR AND
%right "="
%left OR AND
%left '>' '<' LE GE EQ NE
%left '+' '-'
%left '*' '/'
%right UMINUS
%left '!'
%%
S       : FOR '(' E ';'{lab1();} E {lab2();}';' E { lab3();}')' E ';'{lab4(); exit(0);}
E       : V '=' {push();} E{codegen_assign();}
         | V '<' {push();} E{codegen_cond();}
         | E '+' {push();} E{codegen();}
         | E '-' {push();} E{codegen();}
         | E '*' {push();} E{codegen();}
         | E '/' {push();} E{codegen();}
         | '(' E ')'
         | '-' {push();} E{codegen_umin();} %prec UMINUS
         | V
         | NUM{push();}
         ;
V       : ID {push();}
         ;
%%
#include "lex.yy.c"
#include<string.h>
#include<ctype.h>
char st[100][10];
int label[20];
int top=0;
char i_[2]="0";
char temp[2]="t";
int lno=0,ltop=0;
int start;
int main()
{
    printf("Enter the expression:\n");
    yyparse();
}
int push()
{
   strcpy(st[++top],yytext);
}
int codegen()
{
    strcpy(temp,"t");
    strcat(temp,i_);
    printf("%s = %s %s %s\n",temp,st[top-2],st[top-1],st[top]);
    top-=2;
    strcpy(st[top],temp);
    i_[0]++;
}
int codegen_cond()
{}
int codegen_umin()
{
    strcpy(temp,"t");
    strcat(temp,i_);
    printf("%s = -%s\n",temp,st[top]);
    top--;
    strcpy(st[top],temp);
    i_[0]++;
}
int codegen_assign()
{
    printf("%s = %s\n",st[top-2],st[top]);
    top-=2;
}
int lab1()
{
    printf("L%d: \n",lno++);
}
int lab2()
{
    printf("if not %s<%s goto L%d\n",st[top-2],st[top],lno);
 top=top-2;
    i_[0]++;
    label[++ltop]=lno;
    lno++;
    printf("goto L%d\n",lno);
    label[++ltop]=lno;
    printf("L%d: \n",++lno);
}
int lab3()
{
    int x;
    x=label[ltop--];
    printf("goto L%d \n",start);
    printf("L%d: \n",x);
}
int lab4()
{
    int x;
    x=label[ltop--];
    printf("goto L%d \n",lno);
    printf("L%d: \n",x);
}
int yywrap()
{
return 1;
}
