/* @pjs preload="images/jovenes.png","images/jeunes.png","images/femmes.png","images/mujeres.png","images/qdm.png","images/bdm.png"; */
	PImage mapa;

Log log=new Log();
PFont font;
PImagen jovenes, jeunes, femmes, mujeres, bdm, qdm;
PImage[] lista;
void reset(){
setup();
}
void parar(){
}

void setup(){
	idioma=$('#localizacion').val();
	if(idioma=="es"){
	jovenes = loadImage("images/jovenes.png");
	bdm = loadImage("images/bdm.png");
	mujeres = loadImage("images/mujeres.png");
	lista={bdm,  jovenes,  mujeres};
	}else{
	jeunes = loadImage("images/jeunes.png");
	qdm = loadImage("images/qdm.png");
	femmes = loadImage("images/femmes.png");
	lista={ qdm, jeunes, femmes};
	}
	

	font=loadFont("Courier");
	textMode(SCREEN);	
//	textFont(font, sizeTexto); 
	

	colorMode(HSB, 100);
	background(80);
	size(470, 293);
}

int contador=0;
void draw(){
	image(lista[contador%lista.length], 0,0, width, height);
	
	if(frameCount%(30*10)==0){
	contador++;
	
	}
}


public void mouseClicked() {

}
public void keyPressed() {

}

int dameColor(String hex){
	tColor=toxi.color.TColor.newHex(hex);
	int coloritx = color(mapeaValor(tColor.hue()), mapeaValor(tColor.saturation()),
		mapeaValor(tColor.brightness()));
	return coloritx;
}
protected float mapeaValor(float ta) {
	return map(ta, 0, 1, 0, 100);
}

