%{
    #include<stdio.h>
    #include<stdlib.h>
    #include<ctype.h>
    void toUpper(char* s) {
        int i = 0;
        while(s[i]) {
            s[i] = toupper(s[i]);
            i++;
        }
    }
%}
%%
"if"|"else"|"while"|"for"|"int "|"main"|"return" {toUpper(yytext); printf("%s", yytext);}
.|\n {printf("%s", yytext);}
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