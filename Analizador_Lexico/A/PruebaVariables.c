//Esta es una prueba para las declaraciones de variables globales y locales

int g= 8;
void x; //deberia de dar error pues no se pueden declarar variables void

int z, t, y, y;
y;      //se espera error pues se declara variable sin tipo

void funcion2(int a, int b) {
a= a*e;
}  //deberia de aceptarlo bien

int funcion7(){  

int k;  //aceptar como declaracion de variable
int g  //error por no tener ;
a++;
}

int var;  //error pues no se permiten variables globales despues de la primer declaracion de funcion