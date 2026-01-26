#include <iostream>

using namespace std;

float f( int n )  {
    float sum = 0.f, p = 1.f, fact_i = 1.f;
    for (int i = 1; i <= n; i++) {
        fact_i *= i;
        p = 1.f / ( sqrt(fact_i + 3.f) );
        sum += p;
    }
    return sum;
}

void task_1() {
    const float eps = 0.0001;
    float sum = 0, p = 1.f;
    int n = 1, t = 1;
    while (abs(p) > eps) {
        t *= -1;
        p = ( t * f(n) )/( sqrt( (n+1)*(n+3) ) );
        sum += p;
        n += 1;
    }
    cout << sum;
}


int main()
{
    task_1();
}
