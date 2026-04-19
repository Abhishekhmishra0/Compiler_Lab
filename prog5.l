%{
    #include<stdio.h>
    #include<stdlib.h>
    int lines = 0, words = 0, special = 0, letters = 0;
%}
%%
\n {lines++;}
[a-zA-Z0-9]+ {letters += yyleng; words++;}
[ \t]+ ;
[^a-zA-Z0-9 \t]+ {special++;}
%%
int main(){
    yylex();
    printf("Lines = %d, Words = %d, Special Letters = %d, Letters = %d\n",lines, words, special, letters);
}
int yywrap(){
    return 1;
}
