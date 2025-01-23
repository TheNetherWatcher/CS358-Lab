#include <stdio.h>
#include <ctype.h>

int main() {
    FILE *file;
    char filename[100];
    char ch;
    
    int space_count = 0;
    int line_count = 0;
    int char_count = 0;

    printf("Enter the filename: ");
    scanf("%s", filename);

    file = fopen(filename, "r");
    if (file == NULL) {
        printf("Error opening the file.\n");
        return 1;
    }

    while ((ch = fgetc(file)) != EOF) {
        char_count++;  
        
        if (ch == ' ') {
            space_count++;
        }

        if (ch == '\n') {
            line_count++;
            char_count--;
        }
    }

    fclose(file);

    printf("Number of characters: %d\n", char_count);
    printf("Number of spaces: %d\n", space_count);
    printf("Number of lines: %d\n", line_count);

    return 0;
}

