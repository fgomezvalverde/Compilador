/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package generador;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Fabian
 */
public class Pila {
    List<IData> datos = new ArrayList();
    
    public void Push(IData obj)
    {
        //System.out.println(obj.CodigoGenerar());
        datos.add(obj);
    }
    public IData buscarTipo()
    {
        return null;
    }
    public IData Pop()
    {
            //System.out.println("POP");
            IData temp = datos.get(datos.size()-1);
            datos.remove(datos.size()-1);
            return temp;
    }
    public boolean isEmpty()
    {
        return this.datos.isEmpty();
    }
    
    // METODO DE IDENTIFICADOR
    public void setValor_Id(String pvalor)
    {
        //System.out.println("CORRIENDO");
        Identificador temp = (Identificador) Pop();
        temp.setValor(pvalor);
        Push(temp);
    }
    
    
}
