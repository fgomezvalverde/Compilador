package analizador_lexico;
import static analizador_lexico.Token.*;
%%
%class Lexer
%type Token
ALFA = [a-zA-Z_]
NUM = [0-9]
EXP_OCTAL=[0-8]

NUM_OCTAL=”0″({EXP_OCTAL})+

EXP_HEX=[0-9a-fA-F]

NUM_HEX=”0x”({EXP_HEX})+

WHITE=[ \t\r\n]
%{
public String lexeme;
%}
%%
{WHITE} {/*Ignore*/}
"=" {return ASSIGN;}
"+" {return SUMA;}
"*" {return MULT;}
"-" {return RESTA;}
"/" {return DIV;}
{ALFA}({ALFA}|{NUM})* {lexeme=yytext(); return IDENTIFICADOR;}
 ("(-"{NUM}+")")|{NUM}+ {lexeme=yytext(); return INT;}
. {return ERROR;}