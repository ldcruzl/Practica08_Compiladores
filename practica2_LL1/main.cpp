#include <iostream>
#include <stack>
#include <cctype>

using namespace std;

bool validarExpresion(string entrada){
    stack<char> pila;
    for(char c : entrada){
        if(c=='('){
            pila.push(c);
        }else if(c==')'){
            if(pila.empty()){
                return false;
            }
            pila.pop();
        }else if(isalpha(c) || c=='+' || c=='*'){
            continue;
        }else{
            return false;
        }
    }
    return pila.empty();
}

int main(){
    string entrada;

    cout<<"Ingrese expresion: ";
    getline(cin, entrada);
    if(validarExpresion(entrada)){
        cout<<"Cadena aceptada"<<endl;
    }else{
        cout<<"Cadena rechazada"<<endl;
    }

    return 0;
}