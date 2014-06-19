//Esta es una prueba para verificar las estructuras de control, read y write
//switch, case, default, read, write

int funcion1(int x){

        case 5: x++;  //se espera que de error por estar fuera de switch
        default: x++;

        switch () { }  //se espera error por no tener expresion

        switch(x) {

                case 5:    //se espera error por no tener ;
                case 8: {}  //se espera que lo acepte correctamente
                case 5: {break;}  // se espera que lo acepte
                case: {}       //se espera error por no tener expresion constante
        }

        read;  //se espera error

        read(x++); //se espera error

        write(C);    //se espera que lo acepte
        write( );     //se espera error]
}

