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
public class Literal implements IData{

    String valor;
    int linea;
    public Literal(String pvalor)
    {
        valor = pvalor;
    }
        public void setValor(String pvalor)
    {
        valor= pvalor;
    }
    public String CodigoGenerar() {
        return valor+"\n";
    }
    public String valor()
    {return valor;}
    public int getTipo()
    {return 2;}
        public int getLinea()
    {
        return linea;
    }
}
