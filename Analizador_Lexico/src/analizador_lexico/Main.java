/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package analizador_lexico;



import analizador_semantico.Parser;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
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
        File file=new File("src/analizador_lexico/Lexer.flex");
        JFlex.Main.generate(file);
        
       /*String[] argumentos = {"-interface", "-destdir", "src", 
                "-parser", "Parser", "src/analizador_semantico/Parser.cup"};
        java_cup.Main.main(argumentos);*/
        
        
        Reader reader  = new BufferedReader(new FileReader("prueba.txt"));
        Scanner lexer = new Scanner (reader);
         try {
	  Parser p = new Parser(lexer);
        p.parse();
       

      }
      catch (Exception e) {
        e.printStackTrace(System.out);
        System.exit(1);
      }
        
        
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
    
    
        private Token token;
    private Symbol tipoToken;

    private ArrayList<String> lexemas;
    private ArrayList<Token> tokens;

    /*public void runScanner(String file) throws FileNotFoundException, IOException {
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

    }*/
    
    
 }

