# Java-Compiler
Compiler to transform code to Java to Assembler. using Flex and Cup.

##Passing throw:
1. Lexical Analysis: passing all the words from the code throw a scanner to evaluate if is a valid code. using Flex
2. Syntactic Analysis: evaluate these strings as group. 
3. Semantic Analysis: pass al the strings throw the rules, to see if all the lines have a meaning throw the rules.
4. Synthesis: take all the evaluation of the code, and get the translation of the these valid code.
  
The progam can works by two ways:
###1. Reading a plain text file and create a new file as a output.
###2. Reading a plain text file and print the result in console.

For example:
input
```
int a = 2;
a = a + 5;
```

output
```
mov eax, 2 ;
mov edx, 5 ;
add eax,edx ;
```

Valid operations: (arithmethic, while, functions, while, for, if, else, switch,return and main method).

