%{
/**
 * Arithmetic Expression Calculator Parser
 * 
 * This parser evaluates basic arithmetic expressions with
 * addition, subtraction, multiplication, division, and parentheses.
 */
#include <stdio.h>

/* Function prototypes */
int yylex(void);
int yyerror(char *errorMsg);
%}

/* Define data types for our grammar symbols */
%union {
    int value;  /* Numeric value for calculations */
}

/* Token declarations */
%token <value> NUMBER
%token PLUS MINUS TIMES DIVIDE LPAREN RPAREN

/* Operator precedence (lowest to highest) */
%left PLUS MINUS
%left TIMES DIVIDE
%right UMINUS  /* Unary minus operator */

/* Type declarations for non-terminals */
%type <value> Expression Term Factor

%%
/* Grammar rules */

/* Main statement - print the final result */
Statement : Expression { 
    printf("Result: %d\n", $1); 
}
;

/* Expression handling addition and subtraction */
Expression : Expression PLUS Term    { $$ = $1 + $3; }
          | Expression MINUS Term   { $$ = $1 - $3; }
          | Term                    { $$ = $1; }
;

/* Term handling multiplication and division */
Term : Term TIMES Factor   { $$ = $1 * $3; }
     | Term DIVIDE Factor  { 
         if ($3 == 0) {
             yyerror("Division by zero");
             $$ = 0;  /* Default value when division by zero */
         } else {
             $$ = $1 / $3;
         }
       }
     | Factor              { $$ = $1; }
;

/* Factor handling numbers, parenthesized expressions, and unary minus */
Factor : NUMBER            { $$ = $1; }
       | LPAREN Expression RPAREN { $$ = $2; }
       | MINUS Factor      { $$ = -$2; /* Handle negative numbers */ }
;

%%

/**
 * Main function - entry point of the calculator program
 */
int main() {
    printf("Enter an arithmetic expression: ");
    yyparse();
    return 0;
}

/**
 * Error handling function
 */
int yyerror(char *errorMsg) {
    printf("Error: %s\n", errorMsg);
    return 0;
}