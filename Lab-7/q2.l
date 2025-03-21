%{
#include "y.tab.h"
#include <stdio.h>
int paren_count = 0;
int brace_count = 0;
%}
%%
"("             { paren_count++; }
")"             { paren_count--; }
"{"             { brace_count++; }
"}"             { brace_count--; }
.|\n            { /* ignore all other characters */ }
%%
int yywrap() { return 1; }
