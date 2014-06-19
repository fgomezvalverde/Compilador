
int x;                          
int funcion1(){

        if () {} else {}  //deberia dar error, pues debe haber una expresion
        if (x=2) {x++;} else {x--;}  //deberia aceptarlo sin error
        if if (1) {;} else {;} //deberia dar error por doble if
        if (1) {x++; }else {x--; }else {x;} //deberia dar error por doble uso de else
        
        for ( ) {}  //deberia dar error pues no hay expresiones en parentesis

        for (x=0; ) {} //error pues hay solamente una expresion
        for (x,y,z)  {}  //error pues estan separados solamente por comas

        
        while ( ){}  //debe dar error
        while (1) {x++;}  // aceptarlo correctamente
        while (0) { x++; x--; continue; break;}  //aceptarlo correctamente, el continue y el break
       

}

