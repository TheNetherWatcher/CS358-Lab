%{
    #include "y.tab.h"
%}

%%
A {return A;}
B {return B;}
\n {return NL;}
. {return yytext[0];}
%%

int yywrap(){
    return 1;
}