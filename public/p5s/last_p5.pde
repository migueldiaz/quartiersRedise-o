Log log=new Log();
PFont font;

String[] ciudades={"Rio de Janeiro","La Maré","Paris","Belleville","Dakar","Pikine","Ndiago","Grand Yoff","Wakhinane","Bamako","Dialakorodji","Sikoro","Niamakoro","Salé","Hay Inbiat","Sidi Moussa","Laâyayda","Ouarzazate","Sidi Daoud","Taskoukte","Bogota","Suba","Loma Verde","Chapinero","El Alto","Bruxelles","Forest"};

String[] mujeres={"mujeres","ciudadanas","derechos","participación","defensa","barrios populares","solidaridad","amistad","intercambios","papel","reconocomiento","autonomía","diálogo","empoderamiento","igualdad"};

String femmes={"femmes","citoyennes","droits","participation","plaidoyer","quartiers populaires","solidarité","amitié","échanges","rôle","reconnaissance","autonomie","dialogue","empowerment","égalité"};

String[] jovenes={"jóvenes","participación","poder","protagonismo ","barrios populares","chicas y chicos","trayectorias","expresión","arte y cultura","cambio","ciudadania","identidades","intercambios","igualdad","políticas publicas"};

String[] jeunes={"jeunes","participation","pouvoir","protagonisme ","quartiers populaires","filles et garcons","trajectoires","expression","art et culture","changement","citoyenneté","identités","échanges","égalité","politiques publiques"};

String[] colores={"fe4a00", "b5afaf", "ffffff", "ffb629", "ff813b", "ff640d", "ffd648", "ffad10", "f6f6f6", "fbfbfb", "dedede", "d4d3d2"};
 
 
//falta::: "BDM","red","QDM","réseau",

ArrayList elementos=new ArrayList();

void setup(){
elementos.add(ciudades);
elementos.add(mujeres);
elementos.add(femmes);
elementos.add(jovenes);
elementos.add(jeunes);


	font=loadFont("Courier");
textMode(SCREEN);	
textFont(font, sizeTexto); 
	hint(DISABLE_OPENGL_2X_SMOOTH);
	colorMode(HSB, 100);
	background(80);
	size(800, 400);
	/*
	logea("ciudades", ciudades);
	logea("mujeres", mujeres);
	logea("femmes", femmes);
	logea("jovenes", jovenes);
	logea("jeunes", jeunes);
	*/
	 mensaje=elementos.get(contadorElementos).toString();
	 pinta();
}

void logea(String mensaje,String[] arr){
	for(String valor: arr)
	log.info(valor);
	log.info(mensaje+":"+arr.length);

}

void resetPosiciones(){
 posicionX=0;
 posicionY=0;
}
int limiteRandomSup=20;
int limiteRandomInf=10;
int sizeTexto=60;
int posicionX=0;
int posicionY=0;
int posicionInicial=0;
String mensaje;
boolean finalAlcanzado;
int contadorElementos=0;
void draw(){
	if(frameCount%(30*10)==0){
		if(finalAlcanzado){
		contadorElementos++;
			background(100);
			mensaje=jovenes.toString();
			 mensaje=elementos.get(contadorElementos%elementos.size()).toString();
			
			posicionInicial=-1;
			resetPosiciones();
			finalAlcanzado=false;
		}
		pinta();
	}
}

public void pinta(){
	background(dameColor(colores[2]));
  for(int posicion=posicionInicial; posicionInicial<mensaje.length(); posicionInicial++){

    char caracterActual=mensaje.charAt(posicionInicial);

    float alturaMaximaExacta=textAscent();
    float alturaMinimaExacta=textDescent();


    float anchoCaracter=textWidth(caracterActual);

    noStroke();
    
     if(posicionX+anchoCaracter>=width){
      posicionX=0;
      posicionY+=alturaMaximaExacta+alturaMinimaExacta;
    }
    	float rectHeight=alturaMaximaExacta+alturaMinimaExacta;
    	float randomRect=random(-limiteRandomSup,-limiteRandomInf);
    	float randomRectPos=random(limiteRandomInf, limiteRandomSup);
		fill(dameColor(colores[(int)random(8,10)]));
        rect(posicionX+randomRectPos, posicionY+randomRectPos, anchoCaracter+randomRect, rectHeight+randomRect);
        fill(dameColor(colores[(int)random(3,7)]));
    text(caracterActual, posicionX+random(-5,5), posicionY+alturaMaximaExacta+random(-5,5));
    posicionX=posicionX+anchoCaracter;
    if((posicionY+alturaMaximaExacta+alturaMinimaExacta)>=height){
		resetPosiciones();
		break;
     }
     
     if(posicionInicial==mensaje.length()-2){
		finalAlcanzado=true;      
      }
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

