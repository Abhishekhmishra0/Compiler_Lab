%{
    #include<stdio.h>
    #include<stdlib.h>
    #include "prog13.tab.h"
%}
%%
"if" {return IF;}
"(" {return '(';}
")" {return ')';}
"{" {return LB;}
"}" {return RB;}

[a-zA-Z0-9]+   { return OTHER; }
[ \t\n]        ;
.              ;
%%

int yywrap() { 
    return 1; 
}