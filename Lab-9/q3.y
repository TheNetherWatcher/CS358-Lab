%{
/**
 * Word Counter Parser
 * 
 * This parser counts occurrences of a specific word in input text.
 * The comparison is case-insensitive.
 */
#include <stdio.h>
#include <string.h>
#include <ctype.h>

/* Global variables */
char searchWord[100];  /* The word we're searching for */
int occurrenceCount = 0;  /* Counter for word occurrences */

/* Function prototypes */
void convertToLowercase(char *text);
int yylex(void);
int yyerror(char *errorMsg);
%}

/* Define data types for our grammar symbols */
%union {
    char text[100];  /* Buffer for storing words */
}

/* Token declarations */
%token <text> WORD
%token SPACE OTHER

/* Type declarations for non-terminals */
%type <text> Statement

%%
/* Grammar rules */

/* Process input text word by word */
Statement : /* empty */
        | Statement WORD  {
            /* Make a copy of the current word */
            char currentWord[100];
            strcpy(currentWord, $2);
            
            /* Convert to lowercase for case-insensitive comparison */
            convertToLowercase(currentWord);
            
            /* Increment counter if word matches */
            if(strcmp(currentWord, searchWord) == 0)
                occurrenceCount++;
        }
        | Statement SPACE { /* Ignore whitespace */ }
        | Statement OTHER { /* Ignore punctuation and other characters */ }
;

%%

/**
 * Converts a string to lowercase
 * 
 * @param text The string to convert
 */
void convertToLowercase(char *text) {
    int i;
    for(i = 0; text[i]; i++)
        text[i] = tolower(text[i]);
}

/**
 * Main function - entry point of the word counter program
 */
int main() {
    /* Get the word to search for */
    printf("Enter the word to count: ");
    scanf("%s", searchWord);
    
    /* Convert target word to lowercase for comparison */
    convertToLowercase(searchWord);
    
    /* Prompt for text input */
    printf("Enter the text (Ctrl+D to end on Unix, Ctrl+Z on Windows):\n");
    
    /* Clear input buffer (consume leftover newline) */
    while(getchar() != '\n');
    
    /* Parse the input text */
    yyparse();
    
    /* Display results */
    printf("The word \"%s\" appears %d times in the text.\n", searchWord, occurrenceCount);
    return 0;
}

/**
 * Error handling function
 */
int yyerror(char *errorMsg) {
    printf("Error: %s\n", errorMsg);
    return 0;
}