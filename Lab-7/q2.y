%{
#include <stdio.h>
extern int paren_count;
extern int brace_count;
%}
%%
input: 
      /* empty */
    | input line
    ;
line:
      /* we don't need to process individual lines */
    ;
%%
int main() {
    yyparse();
    if (paren_count == 0 && brace_count == 0)
         printf("Parenthesis are balanced\n");
    else {
         if(paren_count != 0)
              printf("Parenthesis () are not balanced\n");
         if(brace_count != 0)
              printf("Parenthesis {} are not balanced\n");
    }
    return 0;
}

int yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
    return 0;
}
