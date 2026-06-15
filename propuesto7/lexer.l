%{
#include "parser.tab.h"
%}

%%

"c"         { return C; }
"d"         { return D; }

[ \t]       ;
\n          { return '\n'; }

.           { return ERROR; }

%%

int yywrap(){
    return 1;
}
