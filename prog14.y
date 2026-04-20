%{
    #include<stdio.h>
    #include<stdlib.h>
    #include<ctype.h>
    int yylex();
    void yyerror(char* s);
%}
%token ID 
%%
E : ID {printf("Valid Identifier\n");}
%%
int main() {
    yyparse();
    return 0;
}
void yyerror(char* s) {
    printf("Invalid Identifier\n");
}