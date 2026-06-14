%{
#include "parser.tab.h"
%}

%%
[a-zA-Z]+       { return ID; }
"+"             { return MAS; }
"*"             { return MULT; }
"("             { return PARI; }
")"             { return PARD; }

[ \t]           ;
\n              { return '\n'; }
.               { return ERROR; }
%%

int yywrap(){
    return 1;
}