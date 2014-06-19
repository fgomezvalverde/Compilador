int x;

void funcion3( x, y){ 
	if (x<7){
		x= g+6;
	}
} 

int funcion4(int, int){ //no se permite solo los tipos
	if (x<7){
		x= g+6;
	}
}  

funcion5(){
	if (x<7){
		x= g+6;
	}
}    //no se permiten signatures sin tipo


int funcion4 { 
	if (x<7){
		x= g+6;
	}
}  //no se puede declarar una funcion sin ( )