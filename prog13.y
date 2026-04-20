%{
    #include<stdlib.h>
    #include<stdio.h>
    #include<ctype.h>
    int level = 0;
    int max = 0;
    int yylex();
    void yyerror(char* s);
%}
%token IF OTHER LB RB
%%
S : IF '(' OTHER ')' B
    | OTHER
    ;
B : LB {level++; if(level > max) max = level;} L RB {level--;}
    ;
L : L S
    | ;
%%
int main() {
    yyparse();
    printf("Max Level of if is: %d\n", max);
    return 0;
}
void yyerror(char* s) {
    printf("Invalid Expression\n");
}