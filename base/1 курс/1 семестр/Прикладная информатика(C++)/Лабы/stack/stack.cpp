#include <iostream>
#include <string>

using namespace std;

void main() 
{
	string arr[20];
	string slova;
	cin >> slova;
	int i = 0, k=0, count = 0;
	//slova = "sdkjfnsdui sdlfnsldin fdsdofnsdfn"
	string molva;
	while (slova[i-1] != '\0') 
	{
		if (slova[i] == ' ')
		{
			arr[i] = slova.substr(k, i - k - 1);
			k = i - 1;
			count++;
		}
		i++;
	}
	int a1, a2;
	for (int j = 0; j < 20; j++) {
		for (int f = 0; f < j; f++) {
			/*a1 = strlen(arr[i]);
			a2 = sizeof(arr[f]) / sizeof(' ');*/
			cout << typeid(arr[i]).name();
			/*cout << a1<< ', ' << a2 << ';';
			a1 = min(a1, a2);
			for (int b = 0; b < a1; b++) {
				if (arr[j][i] = arr[f][i]) {
					continue;
				}
				if (arr[j][i] > arr[f][i]) {
					int temp = arr[j][i];
					arr[j][i] = arr[f][i];
					arr[f][i] = temp;
				}
			}*/
		}
	}


	for (int j = 0; j < 20; j++) cout << arr[j] << ' ';
	
}
