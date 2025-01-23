#include <stdio.h>
#include <string.h>

int main() {
    char *keywords[] = {"int", "float", "if", "else", "return", "for", "while", "do", "break", "char", "double", "switch", "case", "default", "void", "const", "enum", "extern", "goto", "long", "register", "short", "signed", "sizeof", "static", "struct", "typedef", "union", "unsigned", "volatile", "continue", "auto", "restrict"};
    int n = sizeof(keywords) / sizeof(keywords[0]);
    char str[50];
    int isKeyword = 0;
    printf("Enter a string: ");
    scanf("%s", str);
    for (int i = 0; i < n; i++) {
        if (strcmp(str, keywords[i]) == 0) {
            isKeyword = 1;
            break;
        }
    }
    if (isKeyword)
        printf("The string is a keyword.\n");
    else
        printf("The string is not a keyword.\n");
    return 0;
}
