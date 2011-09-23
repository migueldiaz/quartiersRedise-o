PFont fuente;
void setup(){
background(0);
size(300, 300);
fill(255);
rect(100, 100, 100, 100);
fuente=createFont("Arial", 20, true);
textFont(fuente);
}
String encoding;

void llamada(data) {
encoding=data.encoding;
println(encoding);
fill(255);
rect(0,0, 100, 100);
fill(255,0,0);
text(encoding, 50, 50);
      println("eyyy"+data.objetos.length);
	tracear();
	listEvents(data);
}


void mousePressed(){
//$.getJSON('./nave_v2.json', llamada);
$.getJSON('http://ecotonal.appspot.com/multiverso?doc=nave&sheet=p5', llamada);

background(0);
}

void draw(){
}

void pintaRectRojo(){
fill(255, 0,0);
rect(50,50,50,50);
println("ole");
}