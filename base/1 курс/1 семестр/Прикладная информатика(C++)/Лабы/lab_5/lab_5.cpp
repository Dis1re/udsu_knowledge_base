#include <iostream>

using namespace std;

void task_1() {
	cout << "task_1" << endl;
	int i, count = 0;
	bool exitFlag = true;
	const int n = 10;
	int arr[n];
	cout << "enter arr elems: " << endl;
	for (i = 0; i < n; i++) {
		cout << "enter arr elems N " << i+1 << " : " << endl;
		cin >> arr[i];
	}
	for (i = 0; i < n-2; i++) {
		if (arr[i] == arr[i+1]) count++;
		if (arr[i+2] == arr[i + 1]) count++;
		if (arr[i] == arr[i + 2]) count++;
		if (count == 3) {
			cout << "there are three same elems : " << i+1 << ", " << i + 2 << ", " << i + 3 << " - " << arr[i] <<endl;
			exitFlag = false;
			break;
 		}
		count = 0;
	}
	if (exitFlag) {
		cout << "there is no three equals elems" << endl;
	}
}

void task_2() {
	cout << "task_2" << endl;
	int i, j;
	const int n = 5;
	int A[n][n];
	//cout << "enter arr size: " << endl;
	//cin >> n;

	for (i = 0; i < n; i++) {
		for (j = 0; j < n; j++) {
			A[i][j] = 0;
		}
	}
	
	for (i = 0; i < n; i++) {
		for (j = i; j < n; j++) {
			A[i][j] = n-j+i;
		}
	}

	for (i = 0; i < n; i++) {
		for (j = 0; j < n; j++) {
			cout << A[i][j] << " ";
		}
		cout << endl;
	}
}

int main()
{
	task_1();
	task_2();
}
