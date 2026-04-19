%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <ctype.h>
%}
%%
https?:\/\/[a-zA-Z0-9./?=_-]+ {
    printf("%s\n", yytext);
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