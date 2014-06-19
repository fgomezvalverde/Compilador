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
public class Funcion implements IData{

    String valor;
    public Funcion(String pvalor)
    {
        valor = pvalor;
    }
    public Funcion(){}
    public void setValor(String pvalor)
    {
        valor= pvalor;
    }
    @Override
    public String CodigoGenerar() {
        return valor;
    }

    @Override
    public String valor() {
        return valor;
    }

    @Override
    public int getTipo() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int getLinea() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
