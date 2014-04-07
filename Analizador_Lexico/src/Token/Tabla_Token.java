/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Token;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Fabian
 */
public class Tabla_Token {
    
    private List<String> Token= new ArrayList<>();
    private List<String> Tipo= new ArrayList<>();
    private List<List<String>> Linea= new ArrayList<>();
    
    public int Tamanio()
    {
        return Token.size();
    }
    
    public void Agregar(String pToken,String pTipo,String pLinea)
    {
        int posicion;
        if(Token.contains(pToken))
        {
            posicion = Token.lastIndexOf(pToken);
            Linea.get(posicion).add(pLinea);
        }
        else
        {
            Token.add(pToken);
            Tipo.add(pTipo);
            List<String> Temp = new ArrayList<>();
            Temp.add(pLinea);
            Linea.add(Temp);
        }
    }
    
    private String Sacar(int x,int y)
    {
        if(y==0)
        {
            return Token.get(x);
        }
        else if(y==1){
            return Tipo.get(x);
        }
        else
        {
            return ConcatenarLineas(x);
        }
    }
    
    public Object[][] HacerTabla()
    {
        Object[][] matriz = new Object[Token.size()][3];
        for(int cont_x=0;cont_x < Token.size(); cont_x++)
        {
            for(int cont_y=0;cont_y < 3; cont_y++)
            {
                
                matriz[cont_x][cont_y] = Sacar(cont_x,cont_y);
            }
        }
        
        
        return matriz;
    }
    
    private String ConcatenarLineas(int x){
        String Resultado = "";
        for(int cont=0;cont < Linea.get(x).size(); cont++){
            Resultado+=Linea.get(x).get(cont)+",";
        }
        return Resultado;
    }
}
