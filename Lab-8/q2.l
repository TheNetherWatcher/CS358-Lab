%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void convertBinaryToDecimal(const char *binary);
%}

%%

[01]+\.[01]+    { convertBinaryToDecimal(yytext); }
[01]+           { convertBinaryToDecimal(yytext); }
.               { printf("Invalid character: %s\n", yytext); }

%%

void convertBinaryToDecimal(const char *binary) {
    double decimal = 0.0;
    int integerPart = 0;
    double fractionPart = 0.0;
    
    int i = 0, len = 0;
    int fractionStart = -1;

    // Find length and check if it's a floating-point binary number
    while (binary[len]) {
        if (binary[len] == '.') {
            fractionStart = len;
        }
        len++;
    }

    // Convert integer part
    if (fractionStart == -1) {
        fractionStart = len;
    }
    for (i = 0; i < fractionStart; i++) {
        integerPart = integerPart * 2 + (binary[i] - '0');
    }

    // Convert fractional part
    if (fractionStart < len - 1) {
        double power = 0.5;
        for (i = fractionStart + 1; i < len; i++) {
            fractionPart += (binary[i] - '0') * power;
            power /= 2;
        }
    }

    decimal = integerPart + fractionPart;
    printf("Binary: %s => Decimal: %.10lf\n", binary, decimal);
}

int yywrap() {
    return 1;
}

int main() {
    printf("Enter a binary number (with or without a decimal point):\n");
    yylex();
    return 0;
}
