%{
#include "y.tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
%}

%%
[ \n]   { return '\n'; }
.       { return yytext[0]; }
%%

int yywrap() {
    return 1;
}
