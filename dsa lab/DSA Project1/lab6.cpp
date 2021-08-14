#include<iostream>
#include<string>
#include<fstream>
#include<stack>
using namespace std;
bool exp(string e)
{
	char c;
	stack<char> s;
	/*cout << " size: "<< s.size() << endl;
	cout << "No of char in expression is: " << e.length() << endl;*/

	for (int i = 0; i < e.length(); i++)
	{
		if (e[i] == '(' || e[i] == '[' || e[i] == '{')
		{
			s.push(e[i]);// pushing in stack 
			continue;
		}

		/*
		cout << "\t  PRINTING ARRAY\n";
		for (int p = 0; p < e.length(); p++)
		{
			cout << e[p] << '\t';
		}
		cout << endl;
		*/

		switch (e[i])
		{
		case ')':
			c = s.top();// store top 
	/*		cout << "--> top : '" << s.top() << "' \n";*/
			s.pop();
			if (c == '{' || c == '[')
				return false;
			break;

		case '}':
			c = s.top(); 	// store top 
		/*	cout << "--> top : '" << s.top() << "' \n";*/
			s.pop();
			if (c == '(' || c == '[')
				return false;
			break;

		case ']':
			c = s.top();// store top 
		/*	cout << "--> top : '" << s.top() << "' \n";*/
			s.pop();
			if (c == '(' || c == '{')
				return false;
			break;
		}
	}
	// at last stack shoud be empty 
	return (s.empty());
}
int main()
{
	string e;
	int no;
	fstream f("input.txt");//open file
	if (f.fail())
	{
		cout << "ERROR !  in opening file\n";
	}


	f >> no;
	//cout << "no " << no;
	f.ignore();  // ignore no

	for (int i = 0; i < no ; i++)
	{
		getline(f, e);
	/*	cout << e;*/

		if (exp(e) == true)
		{
			cout << " Valid\n";
		}
		else if (exp(e) == false)
		{
			cout << " Invalid\n";
		}
	}
	system("pause");
	return 0;
}
