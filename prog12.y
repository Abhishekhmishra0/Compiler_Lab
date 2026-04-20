%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <ctype.h>
    int yylex();
    int yyerror(char* s);
%}
%token NUM
%%
input : input line | ;
line : E '\n' {printf("Result = %d\n",$1);} ;
E : E '+' T {$$ = $1 + $3;}
    |E '-' T {$$ = $1 - $3;}
    |T {$$ = $1;}
    ;
T : T '*' F {$$ = $1 * $3;}
    |T '/' F {$$ = $1 / $3;}
    |F
    ;
F : '(' E ')' {$$ = $2;}
    | NUM {$$ = $1;}
    ;
%% 
int main() {
    yyparse();
    return 0;
}
int yywrap() {
    return 1;
}
int yyerror(char* s) {
    printf("Invalid Expression\n");
    return 0;
}