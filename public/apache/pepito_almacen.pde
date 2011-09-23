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
println(data.encoding);
fill(255);
rect(0,0, 100, 100);
fill(255,0,0);
text(encoding, 50, 50);
      println("eyyy"+data.feed.entry.length);
	tracear();
	listEvents(data);
}


void mousePressed(){
$.getJSON('./nave_v2.json', llamada);
//$.getJSON('http://spreadsheets.google.com/feeds/list/0Aty9iuHXSBaTdDNudVZyVjd1aVJTZ08xenN1U1ZNS1E/od6/public/basic?alt=json', llamada);

background(0);
}

void draw(){
}

void pintaRectRojo(){
fill(255, 0,0);
rect(50,50,50,50);
println("ole");
}