/*
 * c++ ==> 객체지향 p. 
 */
#include <iostream>
#include <string>
#include <stdio.h>

using namespace std;


class Phone {
	string name;
	string telnum;
	string address;
public:
	Phone(string name="", string telnum="", string address=""){
		this->name = name;
		this->telnum = telnum;
		this->address = address;
	}

};




int main(int argc, const char *argv[]) {
		Phone girl, boy;
	
		cin >> girl >> boy;
		cout << girl << endl << boy << endl;

		printf(char* __format, vararg ...);
		scanf(char* __format, vararg ...);

		fprintf(FILE* __stream, char* __format, vararg ...)


	return 0;
}
