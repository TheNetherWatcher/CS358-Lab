%{
#include "y.tab.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
%}

%%

[ \t]+           ;  /* Ignore whitespace */
\n               { return '\n'; }
[0-9]+           { yylval.str = strdup(yytext); return NUMBER; }
[a-zA-Z]+        { yylval.str = strdup(yytext); return VARIABLE; }
"+"              { return PLUS; }
"-"              { return MINUS; }
"*"              { return MUL; }
"/"              { return DIV; }
.                { 
                    printf("Unknown character: %s\n", yytext);
                    exit(1);
                  }

%%

int yywrap(void) {
    return 0;
}
