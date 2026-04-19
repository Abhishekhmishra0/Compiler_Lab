%{
#include <stdio.h>
#include <stdlib.h>

int result = 0;
int num;
char op = '+';
%}

%%
[0-9]+    { 
             num = atoi(yytext);
             if(op == '+') result += num;
             else if(op == '-') result -= num;
             else if(op == '*') result *= num;
             else if(op == '/') result /= num;
          }

[\+\-\*/]  { op = yytext[0]; }

\n         { printf("Result = %d\n", result); result = 0; op = '+'; }
%%

int main() {
    printf("Enter expression:\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}