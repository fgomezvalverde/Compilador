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
    
    String nombre; // Nombre de la variable
    String valor = "0"; // Valor que almacena, solo almacena int
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
       return "\t"+nombre + "\tdb\t";
    }
    public int getTipo()
    {return 1;}
    public int getLinea()
    {
        return linea;
    }
}
