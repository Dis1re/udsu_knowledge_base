
#include <iostream>

using namespace std;

void task1()
{
    float x, y;
    cout << "input x: ";
    cin >> x;
    if (x <= -5) {
        y = x - 4;
    }
    else if (x <= 4) {
            y = -(x * x);
    }
    else {
        y = cos(5);
    }
    cout << "y = " << y;
}

void task2()
{
    float x, y;
    cout << "input x: ";
    cin >> x;
    if (x <= -3) {
        y = 2;
    }
    else if (x <= 0) {
        y = -(2.f / 3.f) * x;
    }
    else if (x <= 1) {
            y = 2.5 * x;
    }
    else {
        y = 2.5;
    }
    cout << "y = " << y;
}

void main() {
    task1();
    task1();
    task1();
}