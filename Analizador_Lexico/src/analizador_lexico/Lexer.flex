

package analizador_lexico;
import java_cup.runtime.*;
import Token.*;
%%

%public
%class Scanner
%implements sym


%line
%column

%cup
%cupdebug

%{
  StringBuffer string = new StringBuffer();
  
  private Symbol symbol(int type) {
    return new JavaSymbol(type, yyline+1, yycolumn+1, yytext());
  }

  private Symbol symbol(int type, Object value) {
    return new JavaSymbol(type, yyline+1, yycolumn+1, yytext(), value);
  }

public String current_lexeme(){
    int l = yyline+1;
    int c = yycolumn+1;
    return " (line: "+l+" , column: "+c+" , lexeme: '"+yytext()+"')";
  }

public String getText(){return yytext();};
public int getLine(){return yyline;}

public int getColumn(){return yycolumn;}
%}

NL         = [\u2028\u2029\u000A\u000B\u000C\u000D\u0085] | \u000D\u000A

Comentario = "/" [^] ~"/" | "/" ""+ "/" | "//"[^\n\r] | "/**" ( [^] | \+ [^/] ) ""+ "/" | "/" ""+ [^/] ~"*/"
Comentario_linea = "//".*{NL}
WhiteSpace = [ \t\f\r\n\v]

Identifier = [A-Za-z_][A-Za-z_0-9]*


DecInteger = 0 | [1-9][0-9]*
OctInteger = 0[0-7][0-7]*
HexInteger = 0[xX][1-9a-fA-F][0-9a-fA-F]*

DecIntegerLiteral = {DecInteger} [uU]?
OctIntegerLiteral = {OctInteger} [uU]?
HexIntegerLiteral = {HexInteger} [uU]?

LongDecIntegerLiteral = {DecInteger} ( [lL] | [uU][lL] | [lL][uU] )
LongOctIntegerLiteral = {OctInteger} ( [lL] | [uU][lL] | [lL][uU] )
LongHexIntegerLiteral = {HexInteger} ( [lL] | [uU][lL] | [lL][uU] )


HexDigit = [0-9a-fA-F]
HexExpPart = [pP][+-]?[0-9]+
HexFloat = 0[xX] ( {HexDigit}+ \.? {HexDigit}* | \. {HexDigit}+ ) {HexExpPart}
HexDoubleLiteral = {HexFloat} [lL]?
HexFloatLiteral = {HexFloat} [fF]

ExponentPart = [eE][+-]?[0-9]+
Float = ( [0-9]+ ( \. [0-9]* {ExponentPart}? | {ExponentPart} ) | \. [0-9]+ {ExponentPart}? )
DoubleLiteral = ( {Float} [lL]? | {HexDoubleLiteral} )
FloatLiteral = ( {Float} [fF] | {HexFloatLiteral} )

%%

<YYINITIAL> {




  /* keywords */
  "boolean"                      { return symbol(BOOLEAN,yytext()); }
  "char"                         { return symbol(CHAR,yytext()); }
  "else"                         { return symbol(ELSE,yytext()); }
  "int"                          { return symbol(INT,yytext()); }
  "if"                           { return symbol(IF,yytext()); }
  "public"                       { return symbol(PUBLIC,yytext()); }
  "return"                       { return symbol(RETURN,yytext()); }
  "void"                         { return symbol(VOID,yytext()); }
  "while"                        { return symbol(WHILE,yytext()); }
  "float"                        { return symbol(FLOAT,yytext()); }
  "long"                        { return symbol(LONG,yytext()); }                            
  "short"                        { return symbol(SHORT,yytext()); }
  "break"                        { return symbol(BREAK,yytext()); }                            
  "case"                        { return symbol(CASE,yytext()); }
  "continue"                        { return symbol(CONTINUE,yytext()); }                            
  "default"                        { return symbol(DEFAULT,yytext()); }
  "do"                        { return symbol(DO,yytext()); }                            
  "for"                        { return symbol(FOR,yytext()); }
  "switch"                        { return symbol(SWITCH,yytext()); }                            
  "read"                        { return symbol(READ,yytext()); }                            
  "write"                        { return symbol(WRITE,yytext()); }
  "const"                       {return symbol(CONST,yytext());}
"unsigned"               {return symbol(UNSIGNED,yytext());}
"auto"                   {return symbol(AUTO,yytext());}
"static"                 {return symbol(STATIC,yytext());}
"enum"      		 {return symbol(ENUM,yytext());}
"extern"      		 {return symbol(EXTERN,yytext());}
"goto"      		 {return symbol(GOTO,yytext());}
"register"               {return symbol(REGISTER,yytext());}
"signed"      		 {return symbol(SIGNED,yytext());}
"sizeof"      		 {return symbol(SIZEOF,yytext());}
"struct"      		 {return symbol(STRUCT,yytext());}
"typedef"      		 {return symbol(TYPEDEF,yytext());}
"volatile"               {return symbol(VOLATILE,yytext());}
  "true"                         { return symbol(BOOLEAN_LITERAL, new Boolean(true)); }
  "false"                        { return symbol(BOOLEAN_LITERAL, new Boolean(false)); }
  "null"                         { return symbol(NULL_LITERAL,yytext()); }

  /* separators */
  "("                            { return symbol(LPAREN,yytext()); }
  ")"                            { return symbol(RPAREN,yytext()); }
  "{"                            { return symbol(LBRACE,yytext()); }
  "}"                            { return symbol(RBRACE,yytext()); }
  "["                            { return symbol(LBRACK,yytext()); }
  "]"                            { return symbol(RBRACK,yytext()); }
  ";"                            { return symbol(SEMICOLON,yytext()); }
  ","                            { return symbol(COMMA,yytext()); }
  "."                            { return symbol(DOT,yytext()); }
  
  /* operators */
  "="                            { return symbol(EQ,yytext()); }
  ">"                            { return symbol(GT,yytext()); }
  "<"                            { return symbol(LT,yytext()); }
  "!"                            { return symbol(NOT,yytext()); }
  "?"                            { return symbol(QUESTION,yytext()); }
  ":"                            { return symbol(COLON,yytext()); }
  "=="                           { return symbol(EQEQ,yytext()); }
  "<="                           { return symbol(LTEQ,yytext()); }
  ">="                           { return symbol(GTEQ,yytext()); }
  "!="                           { return symbol(NOTEQ,yytext()); }
  "&&"                           { return symbol(ANDAND,yytext()); }
  "&"          			   { return symbol(AT,yytext()); }
  "||"                           { return symbol(OROR,yytext()); } 
  "+"                            { return symbol(PLUS,yytext()); }
  "-"                            { return symbol(MINUS,yytext()); }
  "*"                            { return symbol(MULT,yytext()); }
  "/"                            { return symbol(DIV,yytext()); }
  "%"                            { return symbol(MOD,yytext()); }
  "^"                           {return symbol(UP,yytext());}

  "++"                            { return symbol(PLUS_PLUS,yytext()); }
  "--"                            { return symbol(MINUS_MINUS,yytext()); }

  "+="                            { return symbol(PLUS_EQ,yytext()); }
  "-="                            { return symbol(MINUS_EQ,yytext()); }
  "*="                            { return symbol(MULT_EQ,yytext()); }
  "/="                            { return symbol(DIV_EQ,yytext()); }
">>"                     { return symbol(GT_GT,yytext()); }
"<<"                     { return symbol(LT_LT,yytext()); }
"~"                      { return symbol(TOS,yytext()); }
"%="                     { return symbol(MOD_EQ,yytext()); }
"&="                     { return symbol(AT_EQ,yytext()); }
"^="                     { return symbol(UP_EQ,yytext()); }
"|="                     { return symbol(OR_EQ,yytext()); }
"<<="                    { return symbol(LT_LT_EQ,yytext()); }
">>="                    { return symbol(GT_GT_EQ,yytext()); }
"->"                     { return symbol(POINTER,yytext()); }


{DecIntegerLiteral} { return symbol(INTEGER_LITERAL, Integer.valueOf(yytext().replaceAll("[uU]",""),10)); }
  {HexIntegerLiteral} { return symbol(INTEGER_LITERAL, Integer.valueOf(yytext().replaceAll("[uU]","").substring(2),16)); }
  {OctIntegerLiteral} { return symbol(INTEGER_LITERAL, Integer.valueOf(yytext().replaceAll("[uU]","").substring(1),8)); }
  
  // Longs
  {LongDecIntegerLiteral} { return symbol(INTEGER_LITERAL, Long.valueOf(yytext().replaceAll("[uUlL]","").substring(0),10)); }
  {LongHexIntegerLiteral} { return symbol(INTEGER_LITERAL, Long.valueOf(yytext().replaceAll("[uUlL]","").substring(2),16)); }
  {LongOctIntegerLiteral} { return symbol(INTEGER_LITERAL, Long.valueOf(yytext().replaceAll("[uUlL]","").substring(1),8)); }


  {DoubleLiteral} { return symbol(FLOATING_POINT_LITERAL, Double.valueOf(yytext().replaceAll("[lL]",""))); }
  {FloatLiteral} { return symbol(FLOATING_POINT_LITERAL, Float.valueOf(yytext())); }
  
\" [^\"]* \"    { return symbol(STRING_LITERAL, String.valueOf(yytext()));}
\' [^\'] \'        { return symbol(CHARACTER_LITERAL, String.valueOf(yytext()));}

  /* whitespace */
  {Comentario_linea} { /* ignore */}
  {Comentario} { /* ignore */}
  {WhiteSpace} { /* ignore */ }
  


  /* identifiers */
  {Identifier} { return symbol(IDENTIFIER, yytext()); }
}

/* error fallback */
.|\n { throw new RuntimeException("ERROR LEXICO: Illegal character \""+yytext()+"\" at line "+(yyline+1)+", column "+(yycolumn+1)); }
//.|\n   {return symbol(ERROR, yytext());   }                                                        
<<EOF>> { return symbol(EOF); }