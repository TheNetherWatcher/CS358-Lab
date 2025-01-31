#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

int max(int a, int b) {
    return (a > b) ? a : b;
}

int upper_bound(int* arr, int n, int x) {
    int left = 0;
    int right = n;
    
    while (left < right) {
        int mid = left + (right - left) / 2;
        if (x >= arr[mid]) {
            left = mid + 1;
        } else {
            right = mid;
        }
    }
    return left;
}

// O(n*n) approach 
int find_lis_quadratic(int* a, int n) {
    int* d = (int*)malloc(n * sizeof(int));
    if (d == NULL) {
        return -1;
    }
    
    for (int i = 0; i < n; i++) {
        d[i] = 1;
    }
    
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < i; j++) {
            if (a[j] < a[i]) {
                d[i] = max(d[i], d[j] + 1);
            }
        }
    }
    
    int ans = d[0];
    for (int i = 1; i < n; i++) {
        ans = max(ans, d[i]);
    }
    
    free(d);
    return ans;
}

// O(n log n) approach 
int find_lis_optimized(int* a, int n) {
    const int INF = INT_MAX;
    int* d = (int*)malloc((n + 1) * sizeof(int));
    if (d == NULL) {
        return -1;
    }
    
    for (int i = 0; i <= n; i++) {
        d[i] = INF;
    }
    d[0] = INT_MIN;
    
    for (int i = 0; i < n; i++) {
        int pos = upper_bound(d, n + 1, a[i]);
        if (d[pos - 1] < a[i] && a[i] < d[pos]) {
            d[pos] = a[i];
        }
    }
    
    int ans = 0;
    for (int l = 0; l <= n; l++) {
        if (d[l] < INF) {
            ans = l;
        }
    }
    
    free(d);
    return ans;
}

int main() {
    int numbers[] = {10, 22, 9, 33, 21, 50, 41, 60, 80};
    int size = sizeof(numbers) / sizeof(numbers[0]);

    printf("Length of LIS (O(n²) approach): %d\n", 
           find_lis_quadratic(numbers, size));
    printf("Length of LIS (O(n log n) approach): %d\n", 
           find_lis_optimized(numbers, size));
    
    return 0;
}