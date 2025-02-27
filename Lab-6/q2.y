%{
    #include <stdio.h>
    int operators = 0, operands = 0;
%}
%token OPERAND
%left '+' '-' '*' '/'

%%
    start: E {printf("Valid Expression \nNumber of operators: %d\nNumber of operands: %d\n", operators, ++operands); exit(0);}
    E: 
        '(' E ')'
        | '[' E ']'
        | E '+' E {operators++; operands++;} 
        | E '-' E {operators++; operands++;}
        | E '*' E {operators++; operands++;}
        | E '/' E {operators++; operands++;}
        | '-' E
        | OPERAND
%%

void yyerror(char *s) 
{ 
    printf("Invalid Expression \nNumber of operators: %d\nNumber of operands: %d\n", operators, operands);
    exit(0);
}

int main(void){
    printf("> ");
    return yyparse();
}