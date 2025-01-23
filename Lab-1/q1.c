#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <stdbool.h>

const char *keywords[] = {"auto", "break", "case", "char", "const", "continue", "default", "do", "int", "long", "register", "return", "short", "signed", "sizeof", "static", "struct", "switch", "typedef", "union", "unsigned", "void", "volatile", "while", "for", "if", "else", "double", "else", "enum", "extern", "float", "for", "goto", "if"};
int num_keywords = sizeof(keywords) / sizeof(keywords[0]);

int is_valid_identifier(const char *str) {
    bool flag=false;
    if (!(isalpha(str[0]) || str[0] == '_')) {
        return 0;  
    }

    for (int i = 1; str[i] != '\0'; i++) {
        if (!(isalnum(str[i]) || str[i] == '_')) {
            return 0;  
        }
    }

    for (int i = 0; i < num_keywords; i++) {	
        if (strcmp(str, keywords[i]) == 0) {
            flag=true;
            printf("It is a keyword. ");
            return 0;  
        }
    }

    return 1;  
}

int main() {
    char identifier[100];

    printf("Enter an identifier: ");
    scanf("%s", identifier);

    if (is_valid_identifier(identifier)) {
        printf("'%s' is a valid identifier.\n", identifier);
    } else {
        printf("'%s' is not a valid identifier.\n", identifier);
    }
    return 0;
}

