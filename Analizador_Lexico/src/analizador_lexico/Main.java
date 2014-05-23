/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package analizador_lexico;


import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java_cup.runtime.Symbol;


/**
 *
 * @author curso
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) throws FileNotFoundException, IOException, Exception {
        File file=new File("src/analizador_lexico/Lexer.flex");
        JFlex.Main.generate(file);

        String[] argumentos = {"-interface", "-destdir", "src", 
                "-parser", "Parser", "src/analizador_semantico/Parser.cup"};
        java_cup.Main.main(argumentos);
        
        /*Reader reader = null ;
        reader = new BufferedReader(new FileReader("fichero.txt"));
        Scanner lexer = new Scanner (reader);*/
        
        /*while(true )
        {
            System.out.println(lexer.next_token()+"");
            
        }*/
        //mjavac parse = new mjavac(lexer);
        //parse.parse();
       

    }
 }
