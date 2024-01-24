%{
#include <stdio.h>
int lines=0,words=0,s=0,c=0,num=0,spl=0,total=0;
%}
%%
\n {lines++; words++;}
[\t' '] {words++;}
[A-Z] {c++;}
[a-z] {s++;}
[0-9] {num++;}
. {spl++;}
%%
int main(void)
{
	FILE *f = fopen("lab2p5.txt","r");
	if(!f)
	{
		printf("Error opening the file\n");
		return 1;
	}
	yyin = f;
	printf("File opened\n");
	yylex();
	total = s+c+spl;
	printf("Number of lines : %d\n",lines);
	printf("Number of words : %d\n",words);
	printf("Number of lower case alphabet characters : %d\n",s);
	printf("Number of upper case alphabet characters : %d\n",c);
	printf("Number of numeric characters : %d\n",num);
	printf("Total number of characters : %d\n",total);
	fclose(f);
}
int yywrap()
{
	return 1;
}
