
#include <iostream>

using namespace std;

int main()
{
    int year;
    cout << "enter year: " << "\n";
    cin >> year;
    if (((year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0)) && (year != 0)) {
        cout << "it is a leap year" << "\n";
    }
    else {
        cout << "its not a leap yaer" << "\n";
    }
}   