#include <stdio.h>
#include <iostream>
#include <vector>
using namespace std;

int main(){

	auto int_to_vector = [=](int a){
		vector<int> vector_values;
		int valor = a;
		while (valor != 0){
			vector_values.push_back(valor % 10);
			valor = valor / 10;
		}
		return vector_values;
	};

	vector<int> vector_values = int_to_vector(467);

	auto print_vector = [=](vector<int> v){
		for (int i =0; i<v.size();++i)
			cout << v[i] << " ";
	};

	auto is_member = [=](int a, vector<int> v){
		for (int i = 0; i<v.size(); ++i)
			if (a == v[i]) return true;
		return false;
	};

	auto match_numbers = [=](vector<int> v1, vector<int> v2){
		for (int i =0; i < v2.size(); ++i)
			if (!is_member(v2[i],v1)) return false;
		return true;
	};

	auto is_exact = [=](int a){
		vector<int> list = int_to_vector(a); 
		for (int i = 2; i <= 5; ++i){
			int value = a * i;
			vector<int> new_list = int_to_vector(value);
			if (!match_numbers(list,new_list))
				return false;
		}
		return true;
	};

	auto find_number = [=](){

		int a = 1;
		while (true){
			if (is_exact(a)) return a;
			++a;
		}
	};

	cout << "El primer numero que encontre es: " << find_number() << endl;
	

	return 0;
}