#include <iostream>
#include <functional>
#include <vector>
#include <algorithm>
using namespace std;


class Filter {

public:
	vector<function<void(int&)>> funciones;
	vector<int> vi {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};
	int valor;

	Filter(int a){
		valor = a;
	}

	void addFilter(function<void(int&)> f){
		funciones.push_back(f);
	}

	void execute(){
		int a = 5;
		[&](int &){
			a += valor;
		} (a);
	}

	void printPairs(){
		for_each(vi.begin(),vi.end(),[](int a){
			if (a % 2 == 0) cout << a << "a ";
		});
	}

	template <class function>
	void printList(function f){
		for_each(vi.begin(),vi.end(),f);
	}

};

int main(){

	Filter *b = new Filter(10);

	auto f = [b](int& a) mutable {
		a += b->valor;
	};

	int a = 0;
	b->addFilter(f);
	b->execute();

	b->funciones[0](a);
	cout << "a vale: " << a << "\n";

	b->printPairs();
	cout << "\n\n\n";

	int limite = 4;
	auto mayores = [b,limite](int a){
		if (a > limite) cout << a << " ";
	};

	b->printList(mayores);

	cout << "\nTermine:)\n";

	return 0;
}