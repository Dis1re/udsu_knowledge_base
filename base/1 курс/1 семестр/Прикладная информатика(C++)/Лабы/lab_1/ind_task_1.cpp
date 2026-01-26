#include <iostream>

using namespace std;

void task1() {
	float a1, a2, S, a3;
	cout << "input triangle sides: ";
	cin >> a1 >> a2;
	a3 = sqrt((a1 * a1) + (a2 * a2));
	S = (a1 * a2) / 2.f;
	cout << "\n" << "triange area: " << S << "\n";
	cout << "another side: " << a3;
}

void task2() {
	float x1, x2, r1, r2, y;
	cout <<"\n" << "input x1, x2, r1, r2: ";
	cin >> x1 >> x2 >> r1 >> r2;
	y = sqrt( ( (r2 + r1)/(log(r2)) ) + ( (x1 - x2)*(x1 - x2)/(abs(x2)) ) );
	cout <<"\n" << "y: " << y;
}



void main()
{
	task1();
	task2();
}
