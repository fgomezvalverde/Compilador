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
public class While implements IData{
        int linea;
        String valor;
    public While()
    {
    }
    public String CodigoGenerar() {
        return "\twhile: \n";
    }
    public int getTipo()
    {return 3;}
        public int getLinea()
    {
        return linea;
    }
    public void setValor(String pvalor)
    {
        valor= pvalor;
    }
    @Override
    public String valor() {
        return "while";
    }
}
