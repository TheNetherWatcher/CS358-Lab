%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex(void);            // Add this
void yyerror(const char *); // Add this
%}

%%
input: A '\n' { printf("Works.\n"); exit(0); }

A: 'a' A 'b'
 | 'b' B 'a'
 ;

B: 'b'
 ;
%%

int main() {
    if (yyparse() != 0) {
        printf("Failed.\n");
    }
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Syntax Error: %s\n", s);
}
