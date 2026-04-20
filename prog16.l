%{
    #include<stdio.h>
    #include<stdlib.h>
    #include "prog16.tab.h"
%}
%%
[a-z]+ {return STR;}
\n {return 0;}
%%

int yywrap() {
    return 1;
}