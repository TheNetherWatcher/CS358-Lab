#include <stdio.h>
#include <ctype.h>

int main() {
    char str[3000];
    int vowels = 0, consonants = 0, i = 0;
    printf("Enter a string: ");
    fgets(str, sizeof(str), stdin);
    while (str[i]) {
        char c = tolower(str[i]);
        if (c >= 'a' && c <= 'z') {
            if (c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u')
                vowels++;
            else
                consonants++;
        }
        i++;
    }
    printf("Vowels: %d\nConsonants: %d\n", vowels, consonants);
    return 0;
}
