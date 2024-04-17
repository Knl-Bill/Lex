%start GOAL
%token NUM NAME	

%{
#include<stdlib.h>
#include<stdio.h>
int vala=0,valb=0;
int t=0;
%}			

%%

GOAL : NAME '=' EXP { printf("Answer:t%d\t",$3); printf("MOV(@%c,AX)\n",$1); };

EXP : T '+' EXP { $$=t; printf("t%d=t%d + t%d\t",t,$1,$3); printf("ADD(AX,BX)\n"); t++; }
    | T '-' EXP { $$=t; printf("t%d=t%d - t%d\t",t,$1,$3); printf("SUB(AX,BX)\n"); t++; }
    | T '*' EXP { $$=t; printf("t%d=t%d * t%d\t",t,$1,$3); printf("MUL(AX,BX)\n"); t++; }
    | T '/' EXP { $$=t; printf("t%d=t%d / t%d\t",t,$1,$3); printf("DIV(AX,BX)\n"); t++; }
    | T { $$=$1;} ;

T : NUM { $$=t; printf("t%d=%d\t",t,$1); if(vala==0) {printf("MOV(AX,#%d)\n",$1);vala=1;}
                                         else if(valb==0) {printf("MOV(BX,#%d)\n",$1);valb=1;};
                                         t++;}
  | NAME { $$=t; printf("t%d=%c\t",t,$1); if(vala==0) {printf("MOV(AX,@%c)\n",$1);vala=1;}
                                         else if(valb==0) {printf("MOV(BX,@%c)\n",$1);valb=1;};
					 t++;};


%%

#include "lex.yy.c"

int main()
{
  printf("Enter an Expression :");
  yyparse();
  return 0;
}
