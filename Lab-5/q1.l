%{
    #include <stdio.h>
    #include <stdlib.h>
    int i = 2;
    FILE *output;
    int yywrap(void) { return 1; }
%}
    
%%
[a-z] { 
    fprintf(output, "%c", 'a' + (yytext[0] - 'a' + i++) % 26);
    i %= 26;
}
[A-Z] { 
    fprintf(output, "%c", 'A' + (yytext[0] - 'A' + i++) % 26);
    i %= 26;
}
\n  { fprintf(output, "\n"); }
.   { fprintf(output, "%s", yytext); }
%%
    
int main()
{
    extern FILE *yyin;
    yyin = fopen("input.txt", "r");
    output = fopen("output.txt", "w");
    if (!yyin || !output) {
        printf("Error opening files\n");
        exit(1);
    }
    yylex();
    fclose(yyin);
    fclose(output);
    return 0;
}