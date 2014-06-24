/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package generador;

/**
 *
 * @author Adrián
 */
public class Operador implements IData{
    
    String valor;
    int linea;

    public Operador(String pOperador) {
        this.valor = pOperador;
    }

    @Override
    public String CodigoGenerar() {
        throw new UnsupportedOperationException("Not supported yet."); 
    }

    @Override
    public String valor() {
        return valor;
    }

    @Override
    public int getTipo() {
        throw new UnsupportedOperationException("Not supported yet."); 
    }

    @Override
    public int getLinea() {
        return linea;
    }

    @Override
    public void setValor(String pvalor) {
        this.valor = pvalor;
    }
    
}
