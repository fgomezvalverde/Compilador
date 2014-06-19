//Esta es una prueba para probar las expresiones que son aceptadas por el parser

int funcion1(int x){

/////Todas las siguientes expresiones son aceptadas,

++a;
funcion1(4);
x=2;
x= 3*g%23;
funcion1(x=3);      //se espera que acepte llamado a funciones
++x
}

