%{
#include "y.tab.h"
#include <string.h>
#include <stdlib.h>
%}
%%
[a-zA-Z]+   { 
                /* Duplicate the word for use in YACC */
                yylval.str = strdup(yytext);
                return WORD; 
            }
[ \t\n]+    { /* ignore whitespace */ }
.           { /* ignore any other characters */ }
%%
int yywrap(void) { return 1; }
