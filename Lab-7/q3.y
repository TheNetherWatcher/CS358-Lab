%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
void check_helping_verb(char* word);
%}

%union {
    char* str;
}

%token <str> WORD

%%
input: 
      | input wordline
      ;

wordline:
         /* Process each word in the input line */
         | wordline WORD { 
               check_helping_verb($2); 
               free($2); 
           }
         ;
%%
void check_helping_verb(char* word) {
    char lower[100];
    int i;
    for(i = 0; word[i] != '\0'; i++){
        lower[i] = tolower(word[i]);
    }
    lower[i] = '\0';

    const char* helping[] = {
        "am", "is", "are", "was", "were", "being", "been", "be", 
        "have", "has", "had", "do", "does", "did", 
        "will", "would", "shall", "should", "may", "might", "must", "can", "could", NULL
    };
    
    int found = 0;
    for(i = 0; helping[i] != NULL; i++){
        if(strcmp(lower, helping[i]) == 0) {
            found = 1;
            break;
        }
    }
    
    if(found)
        printf("%s: is a helping verb\n", word);
    else
        printf("%s: is not a helping verb\n", word);
}

int main() {
    yyparse();
    return 0;
}

int yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
    return 0;
}
