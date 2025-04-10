%{
/**
 * Parser for palindrome checker application
 * 
 * Checks if input strings are palindromes (read the same forwards and backwards)
 */
#include <stdio.h>
#include <string.h>
#include <ctype.h>

/* Function prototypes */
int isPalindrome(char *text);
int yylex(void);  /* Declaration for the lexer function */
int yyerror(char *errorMsg);  /* Declaration for the error handling function */
%}

/* Define the type for our grammar symbols */
%union {
    char str[100];  /* String buffer for holding input */
}

/* Token and type declarations */
%token <str> STRING
%type <str> Expression

%%
/* Grammar rules */

/* Main rule - evaluate if the expression is a palindrome */
Statement : Expression {
    if(isPalindrome($1))
        printf("\"%s\" is a palindrome.\n", $1);
    else
        printf("\"%s\" is not a palindrome.\n", $1);
}
;

/* Expression is just a STRING token */
Expression : STRING { 
    strcpy($$, $1);  /* Pass the string up the parse tree */
}
;

%%

/**
 * Checks if a string is a palindrome
 * 
 * @param text The string to check
 * @return 1 if palindrome, 0 otherwise
 */
int isPalindrome(char *text) {
    int length = strlen(text);
    int start, end;
    
    /* Convert to lowercase for case-insensitive comparison */
    for(start = 0; start < length; start++)
        text[start] = tolower(text[start]);
    
    /* Check characters from both ends moving inward */
    for(start = 0, end = length - 1; start < end; start++, end--) {
        if(text[start] != text[end])
            return 0;  /* Not a palindrome */
    }
    return 1;  /* Is a palindrome */
}

/**
 * Main function - entry point of the program
 */
int main() {
    printf("Enter a string to check if it's a palindrome: ");
    yyparse();
    return 0;
}

/**
 * Error handling function for parser
 */
int yyerror(char *errorMsg) {
    printf("Error: %s\n", errorMsg);
    return 0;
}