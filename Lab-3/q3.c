#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <stdlib.h>
#include <stdbool.h>

bool isAlphanumeric(char c) {
    return (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || (c >= '0' && c <= '9');
}

void cleanString(const char* input, char* output) {
    int j = 0;
    for (int i = 0; input[i]; i++) {
        if (isAlphanumeric(input[i])) {
            output[j++] = tolower(input[i]);
        }
    }
    output[j] = '\0';
}

bool isPalindrome(const char* str) {
    int left = 0;
    int right = strlen(str) - 1;
    
    while (left < right) {
        if (str[left] != str[right]) {
            return false;
        }
        left++;
        right--;
    }
    return true;
}

void rotateLeft(char* str) {
    int len = strlen(str);
    if (len <= 1) return;
    
    char firstChar = str[0];
    for (int i = 0; i < len - 1; i++) {
        str[i] = str[i + 1];
    }
    str[len - 1] = firstChar;
}

bool isRotatedPalindrome(const char* input) {
    int len = strlen(input);
    char* cleanedStr = (char*)malloc((len + 1) * sizeof(char));
    if (!cleanedStr) return false;
    
    cleanString(input, cleanedStr);
    int cleanedLen = strlen(cleanedStr);
    
    if (cleanedLen == 0) {
        free(cleanedStr);
        return true;  
    }
    
    char* rotatedStr = (char*)malloc((cleanedLen + 1) * sizeof(char));
    if (!rotatedStr) {
        free(cleanedStr);
        return false;
    }
    strcpy(rotatedStr, cleanedStr);
    
    for (int i = 0; i < cleanedLen; i++) {
        if (isPalindrome(rotatedStr)) {
            free(cleanedStr);
            free(rotatedStr);
            return true;
        }
        rotateLeft(rotatedStr);
    }
    
    free(cleanedStr);
    free(rotatedStr);
    return false;
}

int main() {
    const char* testStrings[] = {
        "ABAB",           // false 
        "aaaa",           // true
        "Race a car",    // false
        "A man, a plan, a canal: Panama",  // true
        "a",             // true (single character)
        "Ab@Ba",         // true (after cleaning)
        "aab",           // true
        NULL
    };
    
    for (int i = 0; testStrings[i] != NULL; i++) {
        printf("String: \"%s\"\n", testStrings[i]);
        if (isRotatedPalindrome(testStrings[i])) {
            printf("IS a rotated palindrome\n\n");
        } else {
            printf("is NOT a rotated palindrome\n\n");
        }
    }
    
    return 0;
}