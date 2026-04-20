%{
    #include<stdio.h>
    #include<stdlib.h>
    #include<ctype.h>
    int yylex();
    void yyerror(char* s);
%}
%token A B 
%%
S : E { printf("Valid String\n");}
E : A E | A T ;
T : B T | ;
%%
int main() {
    yyparse();
}
void yyerror(char* s) {
    printf("Invalid String\n");
    exit(0);
}
