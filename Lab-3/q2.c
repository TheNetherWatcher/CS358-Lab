#include <stdio.h>
#include <stdlib.h>

// O(n log n) approach using sorting
int find_missing_sorted(int arr[], int n) {
    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - i - 1; j++) {
            if (arr[j] > arr[j + 1]) {
                int temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
        }
    }
    
    int smallest_positive = 1;
    
    for (int i = 0; i < n; i++) {
        if (arr[i] <= 0) {
            continue;
        }
        
        if (arr[i] == smallest_positive) {
            smallest_positive++;
        } else if (arr[i] > smallest_positive) {
            return smallest_positive;
        }
    }
    
    return smallest_positive;
}

// O(n) approach using array marking
int find_missing_optimized(int arr[], int n) {
    for (int i = 0; i < n; i++) {
        if (arr[i] <= 0 || arr[i] > n) {
            arr[i] = n + 1;
        }
    }
    
    for (int i = 0; i < n; i++) {
        int num = abs(arr[i]);
        if (num <= n) {
            arr[num - 1] = arr[num - 1] > 0 ? -arr[num - 1] : arr[num - 1];
        }
    }
    
    for (int i = 0; i < n; i++) {
        if (arr[i] > 0) {
            return i + 1;
        }
    }
    
    return n + 1;
}

void printArray(int arr[], int n) {
    for (int i = 0; i < n; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");
}

int main() {
    // Test cases
    int arr1[] = {2, 3, -7, 6, 8, 1, -10, 15};
    int n1 = sizeof(arr1) / sizeof(arr1[0]);
    
    int arr2[] = {2, 3, -7, 6, 8, 1, -10, 15};
    int n2 = sizeof(arr2) / sizeof(arr2[0]);
    
    printf("Original array: ");
    printArray(arr1, n1);
    
    printf("Smallest missing positive (Sorting approach): %d\n", 
           find_missing_sorted(arr1, n1));
    
    printf("Smallest missing positive (Optimized approach): %d\n", 
           find_missing_optimized(arr2, n2));
    
    // Additional test cases
    int arr3[] = {1, 2, 3, 4, 5};
    int n3 = sizeof(arr3) / sizeof(arr3[0]);
    printf("\nTest case 2 (consecutive numbers): ");
    printArray(arr3, n3);
    printf("Smallest missing positive (Optimized approach): %d\n", 
           find_missing_optimized(arr3, n3));
    
    int arr4[] = {-5, -3, -1, -2};
    int n4 = sizeof(arr4) / sizeof(arr4[0]);
    printf("\nTest case 3 (all negative): ");
    printArray(arr4, n4);
    printf("Smallest missing positive (Optimized approach): %d\n", 
           find_missing_optimized(arr4, n4));
    
    return 0;
}