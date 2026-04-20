%{
    #include<stdio.h>
    #include<stdlib.h>
    #include<string.h>
    int yylex();
    void yyerror(char* s);
    extern char* yytext;
%}
%token STR
%%
S : STR {
    int n = strlen(yytext);
    if(yytext[0] == yytext[n - 1]) {
        printf("Valid String\n");
    }
    else {
        printf("Invalid String\n");
    }
}
%%
int main() {
    yyparse();
    return 0;
}
void yyerror(char* s) {
    printf("Invalid String\n");
    exit(0);
}
