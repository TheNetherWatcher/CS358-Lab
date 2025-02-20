%{
    #include<stdio.h>
    int print=0, scan=0;
    int yywrap(void) { return 1; }
%}

%%
[ \t\n]         ; /* Skip whitespace */
"printf"        { print++; }
"scanf"         { scan++; }
.|\n            ; /* Skip all other characters */
%%

int main()
{
    extern FILE *yyin;
    yyin = fopen("input.c","r");
    if (!yyin) {
        printf("Could not open test.c\n");
        return 1;
    }
    yylex();
    printf("Number of printf statements = %d\n", print);
    printf("Number of scanf statements = %d\n", scan);
    fclose(yyin);
    return 0;
}