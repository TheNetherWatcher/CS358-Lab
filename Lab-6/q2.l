%{
    #include <stdio.h>
    #include <string.h>
    #include "y.tab.h"

%}

%%
"\n" {
    return 1;
}
[0-9]+|[a-zA-Z][a-zA-Z0-9_]* { 
    return OPERAND;
}
. {
    return yytext[0];
}
%%


int yywrap(void) 
{
    return 1; 
}