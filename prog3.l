%{
    #include<stdio.h>
    #include<stdlib.h>
%}
%%
"if"|"else"|"while"|"for"|"int"|"float"|"double"|"do" {printf("Keyword");}
"*"|"+"|"-"|"/" {printf("Operators");}
[a-zA-Z] {printf("Alphabet");}
[,.(){};] {printf("Symbols");}
.|\n ;
%%
int main(){
    yylex();
    return 0;
}
int yywrap(){
    return 1;
}