%{
#include "y.tab.h"
#include <stdlib.h>
%}

digit   [0-9]
%%
{digit}+            { yylval = atoi(yytext); return NUMBER; }
"("                 { return '('; }
")"                 { return ')'; }
"+"                 { return '+'; }
"-"                 { return '-'; }
"*"                 { return '*'; }
"/"                 { return '/'; }
\n                  { return '\n'; }
[ \t]               { /* ignore whitespace */ }
.                   { /* ignore any other characters */ }
%%
int yywrap(void) { return 1; }
