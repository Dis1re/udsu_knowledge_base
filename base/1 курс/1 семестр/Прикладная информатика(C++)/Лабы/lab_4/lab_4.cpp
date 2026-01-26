#include <iostream>

using namespace std;

void task_1() {
    cout << endl << "task 1";
    float s = 0, p = 1;
    int i;
    for (i = 1; i <= 5; i++) {
        p = i * p;
        s += 1 / (p + 4);
    }
    cout << endl << "ans: " << s;
}

void task_2() {
    cout << endl << "task 2";    
    float s = 0, p = 1, eps;
    int i = 0;
    cout << endl << "input eps: ";
    cin >> eps;
    while (abs(p) > eps) {
        i += 1;
        p *= (i + 1.f)/((-1.f) * (i + 2.f));
        s += p;
    }
    cout << endl << "ans: " << s;
}



int main()
{
    task_1();
    task_2();
}
