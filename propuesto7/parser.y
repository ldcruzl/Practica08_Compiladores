%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);

int error_flag = 0;
%}

%token C D
%token ERROR

%%

input:
    | input linea
;

linea:
    S '\n'
    {
        if (!error_flag)
            printf("Cadena aceptada\n");
        error_flag = 0;
    }
    | '\n'
    | error '\n'
    {
        error_flag = 0;
        yyerrok;
    }
;

S:
    Cc Cc
;

Cc:
    C Cc
    | D
;

%%

void yyerror(const char *s){
    printf("Cadena rechazada\n");
    error_flag = 1;
}

int main(){
    printf("=== Analizador LR - Gramatica S->CC, C->cC|d ===\n");
    printf("Ingrese cadenas:\n\n");
    yyparse();
    return 0;
}
