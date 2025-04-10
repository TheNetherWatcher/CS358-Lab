%{
/**
 * Lexical analyzer for word counter application
 * 
 * This file defines the lexical patterns for the word counting parser,
 * identifying words, spaces, and other characters in the input text.
 */
#include "y.tab.h"
#include <string.h>
%}

%%
[a-zA-Z]+   { 
    strcpy(yylval.text, yytext);  /* Copy the matched word to yylval */
    return WORD;                 /* Return WORD token */
}

[ \t\n]     { return SPACE; }

.           { return OTHER; }

%%

/**
 * yywrap function - called when input is exhausted
 * @return 1 to indicate no further input
 */
int yywrap() {
    return 1;
}