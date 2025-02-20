#include <stdio.h>

int add(int a, int b) {
    printf("Adding two numbers\n");
    return a + b;
}

void readData() {
    int num;
    printf("Enter a number: ");
    scanf("%d", &num);
    printf("You entered: %d\n", num);
}

int main() {
    int x, y;
    printf("Welcome to the program!\n");
    
    printf("Enter first number: ");
    scanf("%d", &x);
    
    printf("Enter second number: ");
    scanf("%d", &y);
    
    int result = add(x, y);
    printf("Result: %d\n", result);
    
    readData();
    
    return 0;
}