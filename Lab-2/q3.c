#include <stdio.h>
#include <string.h>

int main() {
    char line[200];
    printf("Enter a line: ");
    fgets(line, sizeof(line), stdin);
    if (strncmp(line, "//", 2) == 0 || (line[0] == '/' && line[1] == '*'))
        printf("The line is a comment.\n");
    else if (strstr(line, "*/") != NULL)
        printf("The line is the ending of a comment.\n");
    else
        printf("The line is not a comment.\n");
    return 0;
}
