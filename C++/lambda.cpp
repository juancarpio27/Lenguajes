#include <iostream>
#include <functional>
using namespace std;

void ejecutaFuncion(function<void(int&)> const f){
	int a = 5;
	f(a);
}

int main() {

	int z = 2;
	int a = 1;

	auto f = [=](int& b) mutable {
		cout << b << "\n";
		cout << z << "\n";
		cout << a << "\n";
	};
	ejecutaFuncion(f);

}