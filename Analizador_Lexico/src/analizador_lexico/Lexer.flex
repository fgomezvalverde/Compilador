

package analizador_lexico;
import java_cup.runtime.*;
import Token.*;
%%

%public
%class Scanner
%implements sym

%unicode

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

  private long parseLong(int start, int end, int radix) {
    long result = 0;
    long digit;

    for (int i = start; i < end; i++) {
      digit  = Character.digit(yycharat(i),radix);
      result*= radix;
      result+= digit;
    }

    return result;
  }
public int getLine(){return yyline;}

public int getColumn(){return yycolumn;}
%}

/* main character classes */
LineTerminator = \r|\n|\r\n
InputCharacter = [^\r\n]

WhiteSpace = {LineTerminator} | [ \t\f]

/* comments */
Comment = {TraditionalComment} | {EndOfLineComment} | 
          {DocumentationComment}

TraditionalComment = "/*" [^*] ~"*/" | "/*" "*"+ "/"
EndOfLineComment = "//" {InputCharacter}* {LineTerminator}?
DocumentationComment = "/*" "*"+ [^/*] ~"*/"

/* identifiers */
Identifier = [:jletter:][:jletterdigit:]*

/* integer literals */
DecIntegerLiteral = 0 | [1-9][0-9]*

/* floating point literals */        
FloatLiteral  = ({FLit1}|{FLit2}|{FLit3}) {Exponent}? 

FLit1    = [0-9]+ \. [0-9]* 
FLit2    = \. [0-9]+ 
FLit3    = [0-9]+ 
Exponent = [eE] [+-]? [0-9]+

/* HEX AND OCT */
HexIntegerLiteral = 0 [xX] 0* {HexDigit} {1,8}
HexLongLiteral    = 0 [xX] 0* {HexDigit} {1,16} [lL]
HexDigit          = [0-9a-fA-F]

OctIntegerLiteral = 0+ [1-3]? {OctDigit} {1,15}
OctLongLiteral    = 0+ 1? {OctDigit} {1,21} [lL]
OctDigit          = [0-7]




/* string and character literals */
StringCharacter = [^\r\n\"\\]
SingleCharacter = [^\r\n\'\\]

%state STRING, CHARLITERAL

%%

<YYINITIAL> {

//ETIQUETAS
"#"{InputCharacter}* {LineTerminator} {return symbol(ETIQUETA);}



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

//AGREAGADAS 
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


  /* boolean literals */
  "true"                         { return symbol(BOOLEAN_LITERAL, new Boolean(true)); }
  "false"                        { return symbol(BOOLEAN_LITERAL, new Boolean(false)); }
  
  /* null literal */
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
  
    //AGREGADAS DEL ADRIAN
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

  /* string literal */
  \"                             { yybegin(STRING); string.setLength(0); }

  /* character literal */
  \'                             { yybegin(CHARLITERAL); }

  /* numeric literals */
// HEX AND OCT ** MODIFICADAS DE ADRIAN
    {HexLongLiteral}             { return symbol(HEX_LITERAL, new Integer(yytext())); }
    {HexDigit}                   { return symbol(HEX_LITERAL, new Integer(yytext())); } 

    {OctLongLiteral}            { return symbol(OCT_LITERAL, new Integer(yytext())); } 
    {OctDigit}                  { return symbol(OCT_LITERAL, new Integer(yytext())); } 

  {DecIntegerLiteral}            { return symbol(INTEGER_LITERAL, new Integer(yytext())); }

 
  {FloatLiteral}                 { return symbol(FLOATING_POINT_LITERAL, new Float(yytext().substring(0,yylength()))); }
  
  /* comments */
  {Comment}                      { /* ignore */ }

  /* whitespace */
  {WhiteSpace}                   { /* ignore */ }

  /* identifiers */ 
  {Identifier}                   { return symbol(IDENTIFIER, yytext()); }  
}

<STRING> {
  \"                             { yybegin(YYINITIAL); return symbol(STRING_LITERAL, string.toString()); }
  
  {StringCharacter}+             { string.append( yytext() ); }
  
  /* escape sequences */
  "\\b"                          { string.append( '\b' ); }
  "\\t"                          { string.append( '\t' ); }
  "\\n"                          { string.append( '\n' ); }
  "\\f"                          { string.append( '\f' ); }
  "\\r"                          { string.append( '\r' ); }
  "\\\""                         { string.append( '\"' ); }
  "\\'"                          { string.append( '\'' ); }
  "\\\\"                         { string.append( '\\' ); }

  
  /* error cases */
  \\.                            { throw new RuntimeException("Illegal escape sequence \""+yytext()+"\""); }
  {LineTerminator}               { throw new RuntimeException("Unterminated string at end of line"); }
}

<CHARLITERAL> {
  {SingleCharacter}\'            { yybegin(YYINITIAL); return symbol(CHARACTER_LITERAL, new Character(yytext().charAt(0))); }
  
  /* escape sequences */
  "\\b"\'                        { yybegin(YYINITIAL); return symbol(CHARACTER_LITERAL, new Character('\b'));}
  "\\t"\'                        { yybegin(YYINITIAL); return symbol(CHARACTER_LITERAL, new Character('\t'));}
  "\\n"\'                        { yybegin(YYINITIAL); return symbol(CHARACTER_LITERAL, new Character('\n'));}
  "\\f"\'                        { yybegin(YYINITIAL); return symbol(CHARACTER_LITERAL, new Character('\f'));}
  "\\r"\'                        { yybegin(YYINITIAL); return symbol(CHARACTER_LITERAL, new Character('\r'));}
  "\\\""\'                       { yybegin(YYINITIAL); return symbol(CHARACTER_LITERAL, new Character('\"'));}
  "\\'"\'                        { yybegin(YYINITIAL); return symbol(CHARACTER_LITERAL, new Character('\''));}
  "\\\\"\'                       { yybegin(YYINITIAL); return symbol(CHARACTER_LITERAL, new Character('\\')); }

  
  /* error cases */
  {LineTerminator}               { throw new RuntimeException("Unterminated character literal at end of line"); }
}

/* error fallback */

.|\n                             { return symbol(ERROR, yytext());}
//<<EOF>>                          { return symbol(EOF); }