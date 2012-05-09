/* @pjs preload="/images/mapa_def_2.gif","/images/mapa_def_2.gif"; */
	PImage mapa;

Log log=new Log();
PFont font;

String[] ciudades={"Rio de Janeiro","La Maré","Paris","Belleville","Dakar","Pikine","Ndiago","Grand Yoff","Wakhinane","Bamako","Dialakorodji","Sikoro"};
String[] colores={"fe4a00", "b5afaf", "ffffff", "ffb629", "ff813b", "ff640d", "ffd648", "ffad10", "f6f6f6", "fbfbfb", "dedede", "d4d3d2"};
String colorFemme="ff0000";
String colorJeune="fe4a00";

void reset(){
setup();
}
boolean jeunes;
void setup(){
	 jeunes=($("#path").val()=="jeunes");
	mapa = loadImage("/images/mapa_def_2.gif");

	ellipseMode(CORNER);
	

	font=loadFont("Courier");
	textMode(SCREEN);	
	textSize(20);
	noStroke();

	colorMode(HSB, 100);
	background(80);
	size(548, 365);
	ServicioLoadEquiposMiniXML loadEq=new ServicioLoadEquiposMiniXML();
	equipos=loadEq.procesaXML("/"+$("#path").val()+"/equipos.xml");
	smooth();

}


String mensaje;
ArrayList equipos=new ArrayList();
int medida=10;
int abajo=5;
void draw(){

	image(mapa,0,0);
	if (jeunes)
	fill(dameColor(colorJeune));
	else
	fill(dameColor(colorFemme));
	for(EquipoMini em:equipos){
	
				if(mouseX>=em.cx && mouseX<=(em.cx+medida) && mouseY>=em.cy+abajo && mouseY<=(em.cy+medida+abajo)){
				pushStyle();
				fill(dameColor("666666"));
		text(em.nombre, em.cx,em.cy+abajo);	
		ellipse(em.cx, em.cy+abajo, medida, medida);
				popStyle();
		}else{
		ellipse(em.cx, em.cy+abajo, medida, medida);
		}
		
	}

}

void logea(String mensaje,String[] arr){
	for(String valor: arr)
	log.info(valor);
	log.info(mensaje+":"+arr.length());

}





public void mouseClicked() {

}
public void mouseClicked() {
	for(EquipoMini em:equipos){
		if(mouseX>=em.cx && mouseX<=(em.cx+medida) && mouseY>=em.cy && mouseY<=(em.cy+medida)){
			//println("seleccionado "+em.nombre);
			  link("/equipe/sitio?id="+em.id); 
			
		}
	}


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

