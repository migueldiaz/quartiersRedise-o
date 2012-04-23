/* @pjs preload="/images/carte_peters.jpg"; */
	PImage mapa;

Log log=new Log();
PFont font;


void reset(){
setup();
}

void setup(){
	mapa = loadImage("/images/carte_peters.jpg");

	ellipseMode(CORNER);
	

	font=loadFont("Courier");
	textMode(SCREEN);	
	noStroke();
	hint(DISABLE_OPENGL_2X_SMOOTH);

	colorMode(RGB, 100);
	background(80);
	size(548, 342);
	posX=$("#equipo_x").val();
	posY=$("#equipo_y").val();

}

float posX;
float posY;
String mensaje;
int medida=10;

void draw(){

	image(mapa,0,0);	
	fill(100,0,0);
		ellipse(posX, posY, medida, medida);
}



void hola(){
println("hola");
}


public void mouseClicked() {
posX=mouseX;
posY=mouseY;
$("#equipo_y").val(posY);
$("#equipo_x").val(posX);

}

void setXX(pX){
posX=pX;
}

void setYY(pY){
posY=pY;
}

