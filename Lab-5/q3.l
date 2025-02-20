%{
    #include <stdio.h>
    #include <stdlib.h>
    int pos_int=0;
    int neg_int=0;
    int pos_fraction=0;
    int neg_fraction=0;
    int yywrap(void) { return 1; }
%}

%%
[ \t\n]         ; /* Skip whitespace */
\+?[0-9]+       { pos_int++; }
-[0-9]+         { neg_int++; }
\+?[0-9]*\.0+   { pos_int++; }
-[0-9]*\.0+     { neg_int++; }
\+?[0-9]*\.[0-9]+ { pos_fraction++; }
-[0-9]*\.[0-9]+ { neg_fraction++; }
.               ; /* Skip any other character */
%%

int main()
{
    extern FILE *yyin;
    yyin = fopen("numbers.txt","r");
    if (!yyin) {
        printf("Could not open numbers.txt\n");
        return 1;
    }
    yylex();
    printf("Positive Integers: %d\n", pos_int);
    printf("Negative Integers: %d\n", neg_int);
    printf("Positive Fractions: %d\n", pos_fraction);
    printf("Negative Fractions: %d\n", neg_fraction);
    fclose(yyin);
    return 0;
}