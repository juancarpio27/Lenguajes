#include <iostream>
using namespace std;

class Foo {

private:

	int value;

public:

	Foo(int value = 0) : value(value) {
		cout << "Default constructor\n";
	}
	Foo(const Foo& foo){
		cout << "Const copy constructor\n";
	}
	Foo(Foo&& foo){
		cout << "Rvalue copy constructor\n";
	}
	~Foo() = default;

	//Copy assignment (Sobrecargar ==)
	Foo& operator=(const Foo& foo){
		cout << "const copy assignment\n";
		return *this;
	}

	Foo& operator=(Foo&&  foo){
		cout << "Rvalue reference copy assignment\n";
		return *this;
	}

	Foo getFoo(){
		return *this;
	}

	int val(){
		return 5;
	}

};

int main(){
	Foo a;
	Foo b;
	//a = b.getFoo();

	Foo c(Foo());

	//int &&z = a.val();
	//z = 12;
	//cout << z << "\n";
	//Foo c = b; //Se recibe un Lvalue
	//Foo d = a.getFoo();
	//Foo e(e.getFoo()); //Se recibe un Rvalue

	return 0;
}