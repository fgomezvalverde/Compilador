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
public interface IData {
    public String CodigoGenerar();
    public String valor();
    public int getTipo();
    public int getLinea();
    public void setValor(String pvalor);
}
