#include <iostream>
#include <array>

using namespace std;

void selectSort(int arr[], int n) {
    int maxInd;
    float max, c;
    for (int i = 0; i < n-1; i++) {
        max = arr[0];
        maxInd = 0;
        for (int j = 1; j < n-i; j++) {
            if (max < arr[j]) {
                max = arr[j];
                maxInd = j;
            }
        }
        c = arr[n-i-1];
        arr[n-i-1] = arr[maxInd];
        arr[maxInd] = c;
    }
}


void bubbleSort(int arr[], int n) {
    int b;
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            if (arr[i] < arr[j]) {
                b = arr[i];
                arr[i] = arr[j];
                arr[j] = b;
            }
        }
    }
}

d
void shellSort(int arr[], int n) { 
    for (int k = n / 2; k > 0; k /= 2)
    {
        for (int i = k; i < n; i += 1)
        { 
            int b = arr[i];
            int j;
            for (j = i; j >= k && arr[j - k] > b; j -= k) {
                arr[j] = arr[j - k];
            }
            arr[j] = b;
        }
    }
}

void insertSort(int arr[], int n) {
    int k;
    int j;
    for (int i = 1; i < n; i++) {
        k = arr[i];
        j = i - 1;
        while (j >= 0 && arr[j] > k) {
            arr[j + 1] = arr[j];
            j = j - 1;
        }
        arr[j + 1] = k;
    }
}


int main()
{

    srand(time(0));
    const int n = 10;
    int arr[n], sorted[n];

    // заполнение массива случайными числами
    cout << endl << "arr: ";
    for (int i = 0; i < n; i++) {   
        arr[i] = rand() % 100;
        cout << arr[i] << " ";
    }
    
    selectSort(arr, n);
    //insertSort(arr, n);
    //bubbleSort(arr, n);
    //shellSort(arr, n);

    // вывод массива arr
    cout << endl << "sorted arr: ";
    for (int i = 0; i < 10; i++) {
        cout << arr[i] << " ";
    }
}
