%{
#include <stdio.h>
#include <stdlib.h>
%}

%token NUMBER

%left '+' '-'
%left '*' '/'

%%
input:
      /* empty */
    | input line
    ;

line:
      '\n'
    | exp '\n' { printf("Result: %d\n", $1); }
    ;

exp:
      NUMBER
    | exp '+' exp { $$ = $1 + $3; }
    | exp '-' exp { $$ = $1 - $3; }
    | exp '*' exp { $$ = $1 * $3; }
    | exp '/' exp { if($3 == 0) { 
                        printf("Division by zero!\n"); exit(1); 
                     } else { $$ = $1 / $3; } }
    | '(' exp ')' { $$ = $2; }
    ;
%%
int main(void) {
    printf("Enter expression: ");
    yyparse();
    return 0;
}

int yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
    return 0;
}