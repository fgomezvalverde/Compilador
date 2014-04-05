/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package scanner;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.util.LinkedList;
import java.util.List;
/**
 *
 * @author curso
 */
public class Main {

    /**
     * @param args the command line arguments
     * @throws IOException 
     */
    public static void main(String[] args) throws IOException  {
        String path = "C://Users/Fabian//Documents//Compilador//Compilador//bin//scanner//Lexer.flex";
        generarLexer(path);

        
        /*int contIDs=0;
        tokenslist = new LinkedList<identificador>();
        
        Reader reader = new BufferedReader(new FileReader("fichero.txt"));
        Lexer lexer = new Lexer (reader);
        String resultado="";
        while (true){
            Token token =lexer.yylex();
            if (token == null){
                for(int i=0;i<tokenslist.size();i++){
                    System.out.println(tokenslist.get(i).nombre + "=" + tokenslist.get(i).ID);
                }
                System.out.println(resultado);
                return;
            }
            switch (token){
                case SUMA:
                    resultado=resultado+ "<+>";
                    break;
                case RESTA:
                    resultado=resultado+ "<->";
                    break;
                case MULT:
                    resultado=resultado+ "<*>";
                    break;
                case DIV:
                    resultado=resultado+ "</>";
                    break;
                case ASSIGN:
                    resultado=resultado+ "<=>";
                    break;
                case ERROR:
                    resultado=resultado+lexer.yystate()+ "  Error, simbolo no reconocido \n";
                    break;
                case IDENTIFICADOR: {
                    contIDs++;
                    identificador tokenitem=new identificador();
                    tokenitem.nombre=lexer.lexeme;
                    tokenitem.ID=contIDs;
                    tokenslist.add(tokenitem);
                    resultado=resultado+ "<ID" + contIDs + "> ";
                    break;
                }
                case INT:
                    resultado=resultado+lexer.yylength()+ "    < " + lexer.lexeme + "> \n";
                    break;
                default:
                    resultado=resultado+lexer.yylength()+ "  <"+ lexer.lexeme + "> \n";
            }
    }
        
*/
    }
    
    public void tablaResultado(){
        Object[][] matriz = new Object [tokenslist.size()][2];
        for(int i =0; i<tokenslist.size();i++){
            matriz[i][0] = tokenslist.get(i).nombre;
            matriz[i][1] = tokenslist.get(i).ID;
        }
        
    }
     static List<identificador> tokenslist;
    public static void generarLexer(String path){
        File file=new File(path);
        JFlex.Main.generate(file);
    }
 }
