%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <ctype.h>
%}
%%
([0-9]{1,3}\.){3}[0-9]{1,3} {
    int a, b, c, d;
    sscanf(yytext, "%d.%d.%d.%d", &a, &b, &c, &d);
    if(a >= 0 && a <= 255 && b >= 0 && b <= 255 && c >= 0 && c <= 255 && d >= 0 && d <= 255) {
        printf("%s\n", yytext);
    }
}
.|\n ;
%%
int main(int argc, char* argv[]) {
    FILE* fp;
    fp = fopen(argv[1], "r");
    yyin = fp;
    yylex();
    fclose(fp);
    return 0;
}
int yywrap() {
    return 1;
}