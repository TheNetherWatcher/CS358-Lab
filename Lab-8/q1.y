%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_LEN 100

extern int yylex(void); 
void yyerror(const char *s);
%}

/* Define YYSTYPE as char* */
%union {
    char *str;
}

/* Declare tokens and non-terminals with correct types */
%token <str> NUMBER VARIABLE
%token PLUS MINUS MUL DIV
%type <str> expr term factor line

%%

input:
      /* empty */
    | input line
    ;

line:
      expr '\n'  {
                      printf("%s\n", $1);
                      free($1);
                  }
    ;

/* Grammar rules for expressions */
expr:
      expr PLUS term    { 
                            $$ = (char*) malloc(MAX_LEN);
                            if (!$$) { yyerror("Memory allocation failed"); exit(1); }
                            snprintf($$, MAX_LEN, "%s %s +", $1, $3);
                            free($1);
                            free($3);
                        }
    | expr MINUS term   { 
                            $$ = (char*) malloc(MAX_LEN);
                            if (!$$) { yyerror("Memory allocation failed"); exit(1); }
                            snprintf($$, MAX_LEN, "%s %s -", $1, $3);
                            free($1);
                            free($3);
                        }
    | term              { $$ = $1; }
    ;

term:
      term MUL factor   { 
                            $$ = (char*) malloc(MAX_LEN);
                            if (!$$) { yyerror("Memory allocation failed"); exit(1); }
                            snprintf($$, MAX_LEN, "%s %s *", $1, $3);
                            free($1);
                            free($3);
                        }
    | term DIV factor   { 
                            $$ = (char*) malloc(MAX_LEN);
                            if (!$$) { yyerror("Memory allocation failed"); exit(1); }
                            snprintf($$, MAX_LEN, "%s %s /", $1, $3);
                            free($1);
                            free($3);
                        }
    | factor            { $$ = $1; }
    ;

factor:
      NUMBER            { $$ = strdup($1); if (!$$) { yyerror("Memory allocation failed"); exit(1); } }
    | VARIABLE          { $$ = strdup($1); if (!$$) { yyerror("Memory allocation failed"); exit(1); } }
    ;

%%

int main(void) {
    printf("Enter an arithmetic expression (press Enter when done):\n");
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
