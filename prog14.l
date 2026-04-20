%{
    #include "prog14.tab.h"
    #include<stdio.h>
    #include<stdlib.h>
%}
%%
[a-zA-Z][a-zA-Z0-9]* {return ID;}
\n {return 0;}
[ \t] ;
. ;
%%
int yywrap() {
    return 1;
} 