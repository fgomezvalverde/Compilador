package analizador_lexico;
import static Token.Token.*;
import Token.Token;
%%
%class Lexer
%type Token
%line
%char
%column

//GENERALES
    TerminacionLinea = \r|\n|\r\n
    Caracter = [^\r\n]
    Espacio = {TerminacionLinea}|[\t\f]

    Bloque = "/*" [^*] ~"*/"
    ComentarioLinea  = "//" {Caracter}*{TerminacionLinea}

    Identificador = [:jletter:]|[:jletter:][:jletterdigit:]*

//LITERALES
    Entero = 0|[1-9][0-9]*
    Decimal = Entero"."Entero
    Cadenas = "\"" .+ "\""

    Expresion_octal=[0-8]
    Numero_octal=”0″({Expresion_octal})+

    Expresion_hexa=[0-9a-fA-F]
    Numero_hexa=”0x”({Expresion_hexa})+
    
    Literal = {Entero}|{Decimal}|{Cadenas}|{Expresion_octal}|{Numero_octal}|{Expresion_hexa}|{Numero_hexa};

%{
public String lexeme;   
public int linea;
%}
%%

//IGNORAR
{ComentarioLinea}   {}
{Bloque}            {}
[ \t\r\f\n]+        {}

//ETIQUETAS
"#"{Caracter}*{TerminacionLinea} {lexeme=yytext();linea = yyline; return ETIQUETA;}

//PALABRAS RESERVADAS

"auto"      {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"break"     {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"case"      {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"char"      {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"const"     {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"continue"  {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"default"   {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"do"        {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"double"    {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"else"      {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"enum"      {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"extern"    {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"float"     {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"for"       {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"goto"      {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"if"        {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"int"       {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"long"      {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"register"  {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"return"    {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"short"     {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"signed"    {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"sizeof"    {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"static"    {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"struct"    {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"switch"    {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"typedef"   {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"union"     {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"unsigned"  {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"void"      {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"volatile"  {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"while"     {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}

//LITERALES
{Literal} {lexeme=yytext();linea = yyline; return LITERAL;}

// OPERADORES
    //ARITMETICOS
"++"       {lexeme=yytext();linea = yyline; return OPERADOR;}
"-"        {lexeme=yytext();linea = yyline; return OPERADOR;} 
"--"       {lexeme=yytext();linea = yyline; return OPERADOR;}
"*"        {lexeme=yytext();linea = yyline; return OPERADOR;}
"/"        {lexeme=yytext();linea = yyline; return OPERADOR;}
"%"        {lexeme=yytext();linea = yyline; return OPERADOR;}
"+="       {lexeme=yytext();linea = yyline; return OPERADOR;}
"-="       {lexeme=yytext();linea = yyline; return OPERADOR;}
"*="       {lexeme=yytext();linea = yyline; return OPERADOR;}
"/="       {lexeme=yytext();linea = yyline; return OPERADOR;}
"%="       {lexeme=yytext();linea = yyline; return OPERADOR;}
    //COMPARACION
"<"        {lexeme=yytext();linea = yyline; return OPERADOR;}
"<="       {lexeme=yytext();linea = yyline; return OPERADOR;}
">"        {lexeme=yytext();linea = yyline; return OPERADOR;}
">="       {lexeme=yytext();linea = yyline; return OPERADOR;}
"!="       {lexeme=yytext();linea = yyline; return OPERADOR;}
"=="       {lexeme=yytext();linea = yyline; return OPERADOR;}
"!"        {lexeme=yytext();linea = yyline; return OPERADOR;}
"&&"       {lexeme=yytext();linea = yyline; return OPERADOR;}
"||"       {lexeme=yytext();linea = yyline; return OPERADOR;}
"<<"       {lexeme=yytext();linea = yyline; return OPERADOR;}
"<<="      {lexeme=yytext();linea = yyline; return OPERADOR;}
">>"       {lexeme=yytext();linea = yyline; return OPERADOR;}
"~"        {lexeme=yytext();linea = yyline; return OPERADOR;}
"&"        {lexeme=yytext();linea = yyline; return OPERADOR;}
"&="       {lexeme=yytext();linea = yyline; return OPERADOR;}
"|"        {lexeme=yytext();linea = yyline; return OPERADOR;}
"|="       {lexeme=yytext();linea = yyline; return OPERADOR;}
"^"        {lexeme=yytext();linea = yyline; return OPERADOR;}
"^="       {lexeme=yytext();linea = yyline; return OPERADOR;}
"="        {lexeme=yytext();linea = yyline; return OPERADOR;}
"->"       {lexeme=yytext();linea = yyline; return OPERADOR;}
"!"({Literal}|{Identificador})                      {lexeme=yytext();linea = yyline; return OPERADOR;} // !a
"~"({Literal}|{Identificador})                      {lexeme=yytext();linea = yyline; return OPERADOR;} // ~a
"*"({Literal}|{Identificador})                      {lexeme=yytext();linea = yyline; return OPERADOR;} //*a
"&"({Literal}|{Identificador})                      {lexeme=yytext();linea = yyline; return OPERADOR;} //&a
{Identificador}"["({Literal}|{Identificador})"]"    {lexeme=yytext();linea = yyline; return OPERADOR;} //a[b]

//IDENTIFICADOR
{Identificador} {lexeme=yytext();linea = yyline; return IDENTIFICADOR;}

//ERROR
. {lexeme=yytext();linea = yyline;return ERROR;}

