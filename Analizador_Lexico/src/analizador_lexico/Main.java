/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package analizador_lexico;



import static Token.sym.*;
import analizador_semantico.Parser;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Reader;

import java.util.ArrayList;
import java_cup.runtime.Symbol;



/**
 *
 * @author curso
 */
public class Main {

    /**
     * @param args the command line arguments
     * @throws java.io.FileNotFoundException
     */
    public static void main(String args[]) throws FileNotFoundException, IOException, Exception {
        /*File file=new File("src/analizador_lexico/Lexer.flex");
        JFlex.Main.generate(file);*/
        
        /*String[] argumentos = {"-interface", "-destdir", "src", 
                "-parser", "Parser", "src/analizador_semantico/Parser.cup"};
        java_cup.Main.main(argumentos);*/
        
        String nombre_Archivo = "prueba";
        Reader reader  = new BufferedReader(new FileReader(nombre_Archivo+".c"));
        //runScanner(nombre_Archivo);
        Scanner lexer = new Scanner (reader);
	Parser p = new Parser(lexer);
        p.parse();
        System.out.println(p.RESULT);
        try {
			File file = new File("C:\\tasm\\"+nombre_Archivo+".asm");
 
			// if file doesnt exists, then create it
			if (!file.exists()) {
				file.createNewFile();
			}
 
			FileWriter fw = new FileWriter(file.getAbsoluteFile());
			BufferedWriter bw = new BufferedWriter(fw);
			bw.write(p.RESULT);
			bw.close();
 
			System.out.println("Done");
 
		} catch (IOException e) {
			e.printStackTrace();
		}
        
        /*datos endS
            codigo segment
		ASSUME CS:Codigo, DS:Datos, SS:Pila
        
*/
        
        /*Main m = new Main();
        m.runScanner("prueba.txt");*/
        
        ///////
        /*Reader reader = null ;
        reader = new BufferedReader(new FileReader("fichero.txt"));
        Scanner lexer = new Scanner (reader);*/
        
        /*while(true )
        {
            System.out.println(lexer.next_token()+"");
            
        }*/
        //mjavac parse = new mjavac(lexer);
        //parse.parse();
       
        //Scanner lexer1 = new Scanner(new FileReader("prueba.txt"));while (( lexer1.debug_next_token()).sym != EOF) {}
    }
    
    
    private static Token token;
    private static Symbol tipoToken;

    private static ArrayList<String> lexemas;
    public static ArrayList<Token> tokens;

    public static void runScanner(String file) throws FileNotFoundException, IOException {
        Scanner lexer = new Scanner(new FileReader(file));
        lexemas = new ArrayList();
        tokens = new ArrayList();
        
        while ((tipoToken =  lexer.next_token()).sym != EOF) {
            if(tipoToken.sym == ERROR){
            System.out.print("\n");
            System.out.println("ERROR LÉXICO: " + lexer.current_lexeme());
            System.out.print("\n");
                    tipoToken = lexer.next_token();}

            token = new Token(tipoToken);

            if (lexemas.contains(lexer.yytext())) {
               int i = lexemas.indexOf(lexer.yytext());
               tokens.get(i).getLineas().add(lexer.getLine() + "");
            }
            else{
                lexemas.add(lexer.getText());
                token.getLineas().add(lexer.getLine() + "");
                tokens.add(token);
            }
           
        }
        
        System.out.println("********************  TABLA DE TOKENS ********************");
        for(int cont=0;cont < tokens.size(); cont++)
        {
            Token token1 = tokens.get(cont);
            System.out.println(token1.getLexema() + "  ----  " + token1.getTipoToken() + "  ----  " + token1.printLines());
        }

    }
    
    
 }

