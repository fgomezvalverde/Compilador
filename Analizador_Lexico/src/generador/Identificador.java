/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package generador;

/**
 *
 * @author Fabian
 */
public class Identificador implements IData{
    
    String nombre;
    String valor = "0";
    int linea;
    public Identificador(String dato,int plinea)
    {
        nombre = dato;
        linea = plinea;
    }
    public void setValor(String pvalor)
    {
        valor = pvalor;
    }
    public String valor()
    {return nombre;}
    @Override
    public String CodigoGenerar() {
       return "\t"+nombre + "\tdw\t";
    }
    public int getTipo()
    {return 1;}
    public int getLinea()
    {
        return linea;
    }
}
