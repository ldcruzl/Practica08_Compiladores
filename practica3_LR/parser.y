%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
%}

%token ID
%token MAS MULT
%token PARI PARD
%token ERROR

%left MAS
%left MULT

%%

input:
    /* vacío */
    | input linea
;

linea:
    expr '\n'
    {
        printf("Cadena aceptada\n");
    }
    | '\n'
    | error '\n'
    {
        yyerrok;
    }
;

expr:
    expr MAS expr
    | expr MULT expr
    | PARI expr PARD
    | ID
;

%%

void yyerror(const char *s){
    printf("Error sintactico\n");
}

int main(){
    printf("Ingrese expresiones:\n");
    yyparse();
    return 0;
}