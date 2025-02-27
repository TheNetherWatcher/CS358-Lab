%{
    #include <stdio.h>
%}
%token A B NL

%%
    stmt: S {printf("Valid String\n"); exit(0);}
    S: A S | T
    T: B T | NL
%%

void yyerror(char *s) 
{ 
    printf("Invalid String\n");
    exit(0);
}

int main(void){
    printf("> ");
    return yyparse();
}