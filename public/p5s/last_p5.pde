/* @pjs preload="pde/peter_medium.png"; */
	PImage mapa;

Log log=new Log();
PFont font;

String[] ciudades={"Rio de Janeiro","La Maré","Paris","Belleville","Dakar","Pikine","Ndiago","Grand Yoff","Wakhinane","Bamako","Dialakorodji","Sikoro","Niamakoro","Salé","Hay Inbiat","Sidi Moussa","Laâyayda","Ouarzazate","Sidi Daoud","Taskoukte","Bogota","Suba","Loma Verde","Chapinero","El Alto","Bruxelles","Forest"};

String[] mujeres={"mujeres","ciudadanas","derechos","participación","defensa","barrios populares","solidaridad","amistad","intercambios","papel","reconocomiento","autonomía","diálogo","empoderamiento","igualdad"};

String femmes={"femmes","citoyennes","droits","participation","plaidoyer","quartiers populaires","solidarité","amitié","échanges","rôle","reconnaissance","autonomie","dialogue","empowerment","égalité"};

String[] jovenes={"jóvenes","participación","poder","protagonismo ","barrios populares","chicas y chicos","trayectorias","expresión","arte y cultura","cambio","ciudadania","identidades","intercambios","igualdad","políticas publicas"};

String[] jeunes={"jeunes","participation","pouvoir","protagonisme ","quartiers populaires","filles et garcons","trajectoires","expression","art et culture","changement","citoyenneté","identités","échanges","égalité","politiques publiques"};

String[] colores={"fe4a00", "b5afaf", "ffffff", "ffb629", "ff813b", "ff640d", "ffd648", "ffad10", "f6f6f6", "fbfbfb", "dedede", "d4d3d2"};
 
ArrayList elementos_es=new ArrayList();
ArrayList elementos_fr=new ArrayList();

String[]  titulos_es={"BDM", "red", "mujeres", "jóvenes"};

String[]  titulos_fr={"QDM", "réseau", "femmes", "jeunes"};

void reset(){
setup();
}
void parar(){
}

void setup(){
	mapa = loadImage("pde/peter_medium.png");

	elementos_es.add(ciudades);
	elementos_es.add(mujeres);
	elementos_es.add(jovenes);
	elementos_fr.add(ciudades);
	elementos_fr.add(femmes);
	elementos_fr.add(jeunes);

	titulos=titulos_es;
	eles=elementos_es;
	

	font=loadFont("Courier");
	textMode(SCREEN);	
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
	 mensaje=titulos[0];
	 contadorTitulos++;
	 pinta(200);
	 esTitulo=true;
}

int limiteRandomSup=5;
int limiteRandomInf=5;
int sizeTexto=60;
int posicionX=0;
int posicionY=0;
int posicionInicial=0;
String mensaje;
boolean finalAlcanzado;
int contadorElementos=0;
int contadorTitulos=0;
int contadorApariciones=0;
boolean esTitulo;
ArrayList eles;

void inicio(){
 contadorElementos=0;
 contadorApariciones=0;

}

void draw(){
	
	if(frameCount%(30*2)==0){
		if(finalAlcanzado){
		contadorApariciones++;
		if(contadorApariciones%2!=0){
		
		log.debug("titulos");
		int posicion=contadorTitulos%titulos.length();
			mensaje=titulos[posicion];
		contadorTitulos++;
		if(mensaje==titulos[0])
		inicio();		
		}else{
		log.debug("elementos");
				int posicion=contadorElementos%eles.size();
			mensaje=eles.get(posicion).toString();
		contadorElementos++;
		esTitulo=false;
		
		}
			
			posicionInicial=-1;
			resetPosiciones();
			finalAlcanzado=false;
		}
		pinta(sizeTexto+(int)random(-20,50));
	}
}

void logea(String mensaje,String[] arr){
	for(String valor: arr)
	log.info(valor);
	log.info(mensaje+":"+arr.length());

}

void resetPosiciones(){
 posicionX=0;
 posicionY=0;
}

public void pinta(int sizeT){
	fill(100);
	rect(0,0,width, height);
			image(mapa, 0, 0,width,height);
	
	textFont(font, sizeT); 
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
		fill(dameColor(colores[(int)random(8,10)]), random(50,80));
	    if((posicionY+alturaMaximaExacta+alturaMinimaExacta)>=height){
			resetPosiciones();
			break;
	     }
        rect(posicionX+randomRectPos, posicionY+randomRectPos, anchoCaracter+randomRect, rectHeight+randomRect);
        float posXRandom=posicionX+random(-5,5);
        float posYRandom=posicionY+alturaMaximaExacta+random(-3,3);
        
     //filo blanco   
    fill(100);
    text(caracterActual, posXRandom+1, posYRandom+1);
    //fin filo blanco
    fill(dameColor(colores[(int)random(3,7)]));
    text(caracterActual, posXRandom, posYRandom);
    posicionX=posicionX+anchoCaracter;
     
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

