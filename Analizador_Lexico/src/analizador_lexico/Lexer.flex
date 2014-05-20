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
    ComentarioLinea  = "//"{Caracter}*{TerminacionLinea}
    String = """{Caracter}*"""

    Identificador = [:jletter:]|[:jletter:][:jletterdigit:]*
        //Identificador = {Alfa}{Alfa}{Literal}* 

//LITERALES
    Cero = 0
    Expresion_octal=[0-8]
    Numero_octal=”0″({Expresion_octal})+

    Expresion_hexa=[0-9a-fA-F]
    Numero_hexa=”0x”({Expresion_hexa})+
    
    Entero = Cero|[0-9]*
    Alfa = [a-zA-Z_]
    Decimal = Entero"."Entero
    Cadenas = "\"" .+ "\""


    Literal = {Numero_octal}|{Numero_hexa}|{Decimal}|{Entero};

%{
public String lexeme;   
public int linea;
%}
%%
{Entero} {}
{Cero}"x"({Expresion_hexa})+ {lexeme=yytext();linea = yyline; return LITERAL;}
{Cero}({Expresion_octal})+ {lexeme=yytext();linea = yyline; return LITERAL;}

//COMENTARIOS
{ComentarioLinea}   {lexeme=yytext();linea = yyline; return COMENTARIO;}
{Bloque}            {lexeme=yytext();linea = yyline; return COMENTARIO;}
{Cadenas}           {lexeme=yytext();linea = yyline; return COMENTARIO;}
[ \t\r\f\n]+        {}


//ETIQUETAS
"#"{Caracter}*{TerminacionLinea} {lexeme=yytext();linea = yyline; return ETIQUETA;}

//CORCHETES Y PARENTESIS
"("         {lexeme=yytext();linea = yyline; return OTRO;}
")"         {lexeme=yytext();linea = yyline; return OTRO;}
"{"         {lexeme=yytext();linea = yyline; return OTRO;}
"}"         {lexeme=yytext();linea = yyline; return OTRO;}
";"         {lexeme=yytext();linea = yyline; return OTRO;}
","         {lexeme=yytext();linea = yyline; return OTRO;}

//PALABRAS RESERVADAS

"auto"      {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"break"     {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"case"      {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"char""*"*      {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"const"     {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"continue"  {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"default"   {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"do"        {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"double""*"*    {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"else"      {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"enum"      {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"extern"    {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"float""*"*     {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"for"       {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"goto"      {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"if"        {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"int""*"*       {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"long""*"*      {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"register"  {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"return"    {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
"short""*"*     {lexeme=yytext();linea = yyline; return PALABRA_RESERVADA;}
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
"!"({Literal}|{Identificador})                      {lexeme=yytext();linea = yyline; return IDENTIFICADOR;} // !a
"~"({Literal}|{Identificador})                      {lexeme=yytext();linea = yyline; return IDENTIFICADOR;} // ~a
"*"({Literal}|{Identificador})                      {lexeme=yytext();linea = yyline; return IDENTIFICADOR;} //*a
"&"({Literal}|{Identificador})                      {lexeme=yytext();linea = yyline; return IDENTIFICADOR;} //&a
"."({Literal}|{Identificador})("["{Identificador}"]")*                      {lexeme=yytext();linea = yyline; return IDENTIFICADOR;}
"["{Caracter}*"]"    {lexeme=yytext();linea = yyline; return IDENTIFICADOR;} //a[b]
"("{Caracter}*")" {}
//IDENTIFICADOR
{Identificador} {lexeme=yytext();linea = yyline; return IDENTIFICADOR;}

//REGLAS



//ERROR
. {lexeme=yytext();linea = yyline;return ERROR;}




