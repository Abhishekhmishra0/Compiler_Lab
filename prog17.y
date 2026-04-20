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
    int cnt = 0;
    int i = 0;
    while(yytext[i]) {
        if(yytext[i] >= 'a' && yytext[i] <= 'z') {
            cnt++;
        }
        else {
            cnt--;
            if(cnt < 1) { 
                printf("Invalid String\n");
                exit(0);
            }
        }
        i++;
    }
    if(cnt == 1) {
        printf("Valid String\n");
        exit(0);
    }
    else {
        printf("Invalid String\n");
        exit(0);
    }
} ;
%%
int main() {
    yyparse();
    return 0;
}
void yyerror(char* s) {
    printf("Invalid String\n");
    exit(0);
}