/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package analizador_lexico;


import Token.JavaSymbol;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import java_cup.runtime.Symbol;

/**
 *
 * @author Adrián
 */
public class Token {
    
    private Symbol token;
    private ArrayList<String> lineas;
    
    public ArrayList<String> getLineas() {
        return lineas;
    }

    public void setLineas(ArrayList<String> lineas) {
        this.lineas = lineas;
    }
    
    public Token(Symbol symbol){
        this.token = symbol;
        this.lineas = new ArrayList();
    }

    public String getLexema() {
        return ""+ token.value;
    }



    public String getTipoToken() {
        return JavaSymbol.getTokenName(token.sym);
    }


    
    public String printLines(){
        
        String lines = "";
        Set<String> quipu = new HashSet(lineas);
        for (String key : quipu) {
            lines = lines + key + "(" + Collections.frequency(lineas, key) + ") ";
            
        } 
        
        return lines;
    }
    
    
   
}
