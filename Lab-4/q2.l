%{
#include <stdio.h>
int word_count = 0;
int yywrap(void) { return 1; }
%}

%%
[a-zA-Z0-9]+    { word_count++; }
\n              
.               
%%

int main() {
    printf("Enter text (Ctrl+D to end input):\n");
    yylex();  
    printf("Total number of words: %d\n", word_count);
    return 0;
}