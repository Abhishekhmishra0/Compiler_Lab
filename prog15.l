%{
    #include<stdio.h>
    #include<stdlib.h>
    #include "prog15.tab.h"
%}

%%
"a" {return A;}
"b" {return B;}
\n {return 0;}
%%
int yywrap() {
    return 1;
}