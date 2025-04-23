#include <iostream>
using namespace std;
int main()
{
    int n;
    cin >> n;
    int day[1001];
    for (int i = 0; i < n; i++)
    {
        cin >> day[i];
    }
    for (int j = 0; j < (n - 1); j++)
    {
        if (day[j] == 31)
        {
            if (day[j + 1] == 31)
            {
                if (day[j + 2] == 31)
                {
                    cout << "No";
                    return 0;
                }
            }
        }
        else if (day[j] == 28 || day[j] == 29)
        {
            if (day[j + 1] == 30)
            {
                cout << "No";
                return 0;
            }
        }
        else if (day[j] == 30)
        {
            if (day[j + 1] == 30)
            {
                cout << "No";
                return 0;
            }
        }
    }
    cout << "Yes";
    // Look a very looooooooooooooooooooooooooooooooooooooooooooooog striiiiiiiiiiiiiiiiiiiiiiiiiiiiiing
    return 0;
}
