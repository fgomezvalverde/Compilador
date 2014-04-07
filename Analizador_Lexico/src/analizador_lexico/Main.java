/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package analizador_lexico;

import Token.Token;
import static Token.Token.*;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
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
     */
    public static void main(String args[]) {
        File file=new File("C://Users/Fabian//Documents/GitHub/Compilador/Analizador_Lexico/src/analizador_lexico/Lexer.flex");
        JFlex.Main.generate(file);

        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Principal().setVisible(true);
            }
        });
    }
 }
