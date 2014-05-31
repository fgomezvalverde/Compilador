

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
  "boolean"                      { return symbol(BOOLEAN); }
  "char"                         { return symbol(CHAR); }
  "else"                         { return symbol(ELSE); }
  "int"                          { return symbol(INT); }
  "if"                           { return symbol(IF); }
  "public"                       { return symbol(PUBLIC); }
  "return"                       { return symbol(RETURN); }
  "void"                         { return symbol(VOID); }
  "while"                        { return symbol(WHILE); }
  "float"                        { return symbol(FLOAT); }
  "long"                        { return symbol(LONG); }                            
  "short"                        { return symbol(SHORT); }
  "break"                        { return symbol(BREAK); }                            
  "case"                        { return symbol(CASE); }
  "continue"                        { return symbol(CONTINUE); }                            
  "default"                        { return symbol(DEFAULT); }
  "do"                        { return symbol(DO); }                            
  "for"                        { return symbol(FOR); }
  "switch"                        { return symbol(SWITCH); }                            
  "read"                        { return symbol(READ); }                            
  "write"                        { return symbol(WRITE); }
  "const"                       {return symbol(CONST);}
"unsigned"               {return symbol(UNSIGNED);}
"auto"                   {return symbol(AUTO);}
"static"                 {return symbol(STATIC);}
"enum"      		 {return symbol(ENUM);}
"extern"      		 {return symbol(EXTERN);}
"goto"      		 {return symbol(GOTO);}
"register"               {return symbol(REGISTER);}
"signed"      		 {return symbol(SIGNED);}
"sizeof"      		 {return symbol(SIZEOF);}
"struct"      		 {return symbol(STRUCT);}
"typedef"      		 {return symbol(TYPEDEF);}
"volatile"               {return symbol(VOLATILE);}
"main"			 {return symbol(MAIN);}
  "true"                         { return symbol(BOOLEAN_LITERAL, new Boolean(true)); }
  "false"                        { return symbol(BOOLEAN_LITERAL, new Boolean(false)); }
  "null"                         { return symbol(NULL_LITERAL); }

  /* separators */
  "("                            { return symbol(LPAREN); }
  ")"                            { return symbol(RPAREN); }
  "{"                            { return symbol(LBRACE); }
  "}"                            { return symbol(RBRACE); }
  "["                            { return symbol(LBRACK); }
  "]"                            { return symbol(RBRACK); }
  ";"                            { return symbol(SEMICOLON); }
  ","                            { return symbol(COMMA); }
  "."                            { return symbol(DOT); }
  
  /* operators */
  "="                            { return symbol(EQ); }
  ">"                            { return symbol(GT); }
  "<"                            { return symbol(LT); }
  "!"                            { return symbol(NOT); }
  "?"                            { return symbol(QUESTION); }
  ":"                            { return symbol(COLON); }
  "=="                           { return symbol(EQEQ); }
  "<="                           { return symbol(LTEQ); }
  ">="                           { return symbol(GTEQ); }
  "!="                           { return symbol(NOTEQ); }
  "&&"                           { return symbol(ANDAND); }
  "&"          			   { return symbol(AT); }
  "||"                           { return symbol(OROR); } 
  "+"                            { return symbol(PLUS); }
  "-"                            { return symbol(MINUS); }
  "*"                            { return symbol(MULT); }
  "/"                            { return symbol(DIV); }
  "%"                            { return symbol(MOD); }
  "^"                           {return symbol(UP);}

  "++"                            { return symbol(PLUS_PLUS); }
  "--"                            { return symbol(MINUS_MINUS); }

  "+="                            { return symbol(PLUS_EQ); }
  "-="                            { return symbol(MINUS_EQ); }
  "*="                            { return symbol(MULT_EQ); }
  "/="                            { return symbol(DIV_EQ); }
">>"                     { return symbol(GT_GT); }
"<<"                     { return symbol(LT_LT); }
"~"                      { return symbol(TOS); }
"%="                     { return symbol(MOD_EQ); }
"&="                     { return symbol(AT_EQ); }
"^="                     { return symbol(UP_EQ); }
"|="                     { return symbol(OR_EQ); }
"<<="                    { return symbol(LT_LT_EQ); }
">>="                    { return symbol(GT_GT_EQ); }
"->"                     { return symbol(POINTER); }


{DecIntegerLiteral} { return symbol(INTEGER_LITERAL, Integer.valueOf(yytext().replaceAll("[uU]",""),10)); }
  {HexIntegerLiteral} { return symbol(INTEGER_LITERAL, Integer.valueOf(yytext().replaceAll("[uU]","").substring(2),16)); }
  {OctIntegerLiteral} { return symbol(INTEGER_LITERAL, Integer.valueOf(yytext().replaceAll("[uU]","").substring(1),8)); }
  
  // Longs
  {LongDecIntegerLiteral} { return symbol(INTEGER_LITERAL, Long.valueOf(yytext().replaceAll("[uUlL]","").substring(0),10)); }
  {LongHexIntegerLiteral} { return symbol(INTEGER_LITERAL, Long.valueOf(yytext().replaceAll("[uUlL]","").substring(2),16)); }
  {LongOctIntegerLiteral} { return symbol(INTEGER_LITERAL, Long.valueOf(yytext().replaceAll("[uUlL]","").substring(1),8)); }


  {DoubleLiteral} { return symbol(FLOATING_POINT_LITERAL, Double.valueOf(yytext().replaceAll("[lL]",""))); }
  {FloatLiteral} { return symbol(FLOATING_POINT_LITERAL, Float.valueOf(yytext())); }
  
  /* whitespace */
  {WhiteSpace} { /* ignore */ }

  /* identifiers */
  {Identifier} { return symbol(IDENTIFIER, yytext()); }
}

/* error fallback */
.|\n { throw new RuntimeException("Illegal character \""+yytext()+
                                                              "\" at line "+(yyline+1)+", column "+(yycolumn+1)); }
<<EOF>> { return symbol(EOF); }