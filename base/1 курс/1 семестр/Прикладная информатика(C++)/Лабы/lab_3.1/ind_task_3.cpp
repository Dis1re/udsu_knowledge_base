#include <iostream>

using namespace std;

void task1() {
	float x, y, sum = 0;
	int i;
	cout << "input x: ";
	cin >> x;
	for (i = 1; i <= 15; i += 2) {
		sum += ((i - 1) + (i + 1) * x);
	}
	cout << "sum: " << sum;
}

float fact(float n) {
	float p = 1;
	int i;
	for (i = 1; i <= n; i++) {
		p *= i;
	}
	return p;
}

void task2() {
	float x, y, sum, p;
	int i, j;
	for (i = 1; i <= 11; i += 2) {
		x = i;
		sum = 0;
		p = fact(x);
		for (j = 0; j <= 20; j++) {
			sum += (p / i);
		}
		cout << "\n" << "x = " << x << "\n";
		cout << "sum = " << sum;
	}
}

int main()
{
	task2();
}

