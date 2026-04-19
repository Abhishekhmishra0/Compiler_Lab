%{
    #include<stdio.h>
    #include<stdlib.h>
    int lines = 0;
%}
%%
"//".* {lines++;}
"/*"([^*]|\*+[^*/])*\*+"/" {lines++;}
.|\n ;
%%
int main() {
    yylex();
    printf("Lines of comments: %d\n", lines);
    return 0;
}
int yywrap() {
    return 1;
}