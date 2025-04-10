%{
/**
 * Lexical analyzer for calculator application
 * 
 * This file defines the lexical elements for our arithmetic expression parser
 */
#include "y.tab.h"
#include <stdlib.h>
%}

%%
[0-9]+      { 
    yylval.value = atoi(yytext);  /* Store as integer in the union */
    return NUMBER; 
}

"+"         { return PLUS; }
"-"         { return MINUS; }
"*"         { return TIMES; }
"/"         { return DIVIDE; }

"("         { return LPAREN; }
")"         { return RPAREN; }


\n          { return 0; }

.           { printf("Unexpected character: %s\n", yytext); }

%%

/**
 * yywrap function - called when input is exhausted
 * @return 1 to indicate no further input
 */
int yywrap() {
    return 1;
}