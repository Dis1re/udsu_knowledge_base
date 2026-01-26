#include <iostream>

using namespace std;

void task_3_5() {
	const float eps = 0.0000001;
	int i = 0;
	float S = 1, P = 1, x;
	cout << '\n' << "input x : ";
	cin >> x;
	while (P > eps) {
		i++;
		P *= x / i;
		S += P;
	}
	cout << "e = " << exp(x) << "\n";
	cout << "S = " << S;
}

void task_4_5() {
	int i, num=1;
	float a, min = 1;
	cout << "\n" << "input 10 numbers: ";
	for (i = 1; i <= 5; i++) {
		cin >> a;
		float diff = a - int(a);
		if (diff > 0.5) {
			diff -= 0.5;
		}
		if (diff < min) {
			min = diff;
			num = i;
		}
	}
	cout << "ans: " << num;
}



int main()
{
	task_3_5();
	task_4_5();
	return 0;
}