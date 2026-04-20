%{
    #include<stdio.h>
    #include<stdlib.h>
    #include "prog17.tab.h"
%}
%%
[ab*\-+/]+ {return STR;}
\n {return 0;}
%%

int yywrap() {
    return 1;
}