// FUNCIONES

public void funcion_Insertar(Object nombre)
{
    if(nombre.toString().equals("main"))
    {
        funciones.add(nombre.toString());
        MAIN += "main:\n";
        // HACER TODAS LAS COSAS CON LA PILA SEMENTICA


        // VIENE EL CIERRE DEL PROGRAMA
        MAIN += "\tmov ah,4ch\n";
        MAIN += "\tmov al,07h\n";
            
        MAIN += "\tint 21h\n\n";
        MAIN += "codigo endS\n";
        MAIN += "end main";

    }
    else{
        funciones.add(nombre.toString());
        FUNCIONES += nombre.toString()+" Proc Near\n";
        
        //HACER TODAS LAS COSAS CON LA PILA SEMANTICA

        FUNCIONES += nombre.toString()+" endP\n\n";
    }
}

public void revisar_Main()
{
    if(!funciones.contains("main"))
    {
        System.out.println("ERROR SEMANTICO: No se declaro ningun MAIN");
    }
    RESULT += FUNCIONES + MAIN;
}