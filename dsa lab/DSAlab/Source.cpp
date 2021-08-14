#include<iostream>
#include<queue>
#include<fstream>
#include <string>
using namespace std;
int main()
{
	queue<string> q1;
	queue<int> q2;

	queue<int> wait;
	queue<int> turn;
	ifstream f("readylist.txt");//open file
	if (f.fail())
	{
		cout << "Error!";
		exit(0);
	}

	cout << "Display file\n";
	while (!f.eof())//run till end of file
	{
		string s;
		int x;
		f >> s >> x;//read name and number
		q1.push(s);
		q2.push(x);
		cout << s << "\t" << x << endl;
	}
	f.close();
	cout << "__________________\n\n";

	ofstream  of;
	of.open("readylist.txt");
	of.close();

	int p = 0;
	int q = 0;
	f.open("readylist.txt");
	for (int i = 0; i < 1000; i++)
	{
		if ((q2.size() != 0) || (!f.eof()))//run till end or when q2 is not empty
		{
			if (q2.front() + p == i)
			{
				wait.push((i - q2.front()));
				turn.push(q2.front() + (i - q2.front()));
				cout << q1.front() << " " << q2.front() << " " << wait.back() << " " << turn.back() << "\n";//just print 
				q1.pop();
				q2.pop();
				p = i;
			}
			if (i == q + 20)//20 is given in question
			{
				q++;
				if (!f.fail())///when file is open
				{
					while (!f.eof())
					{
						string s;
						int no;
						f >> s >> no;
						q1.push(s);//add into queue
						q2.push(no);//add into queue
					}
				}
			}
		}
	}
	int await = 0, aturn = 0;
	int size_w = wait.size();
	int size_t1 = turn.size();
	while (wait.size() != 0)
	{
		await = await + wait.front();
		aturn = aturn + turn.front();
		wait.pop();
		turn.pop();
	}

	////required ans
	if (size_w != 0 || aturn != 0)//to remove exception 
	{
		cout << "AVG waiting time\t " << await / size_w << "\n";
		cout << "AVG turnarount time\t" << aturn / size_t1 << "\n";
	}
	else 
	{
		cout << "AVG waiting time 0 \n";
		cout << "AVG turnarount time 0\n";
	}

	cout << "NOw file is empty\n";

	system("pause");
	return 0;
}