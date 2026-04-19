%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <ctype.h>
    int valid = 1;
%}
%% 
([0-9]{1,3}\.){3}[0-9]{1,3} {
    int a, b, c, d;
    sscanf(yytext, "%d.%d.%d.%d", &a, &b, &c, &d);
    if(a >= 0 && a <= 255 && b >= 0 && b <= 255 && c >= 0 && c <= 255 && d >= 0 && d <= 255) {
        valid = 1;
    }
    else {
        valid = 0;
    }
}
.|\n ;
%%
int main() {
    yylex();
    if(valid) {
        printf("Valid IP Address\n");
    }
    else {
        printf("Invalid IP Address\n"); 
    }
    return 0;
}
int yywrap() {
    return 1;
}