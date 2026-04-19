%{
    #include<stdio.h>
%}
%% 
Hello {printf("Bye ");}
.|\n {printf("%c", yytext[0]); fflush(stdout);}
%%

int main() {
    yylex();
    return 0;
}
int yywrap() {
    return 1;
}