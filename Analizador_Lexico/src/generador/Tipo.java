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
public class Tipo implements IData{
    int linea;
    String tipo;
        public void setValor(String pvalor)
    {
        tipo= pvalor;
    }
    public Tipo(String tipo)
    {
        this.tipo = tipo;
    }
    public String CodigoGenerar() {
        return "";
    }
    public String valor()
    {return tipo;}
    public int getTipo()
    {return 3;}
        public int getLinea()
    {
        return linea;
    }
}
