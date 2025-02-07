%{
#include <stdio.h>
#include <stdlib.h>
int yywrap(void) { return 1; }
int comment_count = 0;
%}

%%
"/*"[^*]*"*"+[^/]*"/"   { comment_count++; }  // For Multi-line comment
"//".*\n                 { comment_count++; }  // For Single-line comment
[^/]+                    
%%

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s <C_program_file>\n", argv[0]);
        return 1;
    }

    FILE *file = fopen(argv[1], "r");
    if (file == NULL) {
        perror("Error opening file");
        return 1;
    }

    yyin = file;
    yylex(); // Starting lexical analysis

    printf("Number of comments: %d\n", comment_count);

    fclose(file);
    return 0;
}