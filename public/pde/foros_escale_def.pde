/* @pjs preload="pde/peter_medium.png"; */
	PImage mapa;
	List comentarios;
	List comentariosRepresentados = new ArrayList();
	List equipos = new ArrayList();
	List equiposDB = new ArrayList();
	PFont font;
	TransicionEscala transicionEscala;
	Log log=new Log();
	

public void parar(){
	//comentariosRepresentados= new ArrayList();
	noLoop();
}
public void reset(){
	loop();
}

void setup(){
	frameRate(15);
	font=loadFont("Courier New");
	mapa = loadImage("pde/peter_medium.png");
	
	colorMode(HSB, 100);
	background(0);
		//size(mapa.width, mapa.height);
	
	size(mapa.width*(400/mapa.height), 400);
	smooth();
	
	loadEquipos();	
	//println("equipos size::: "+equipos.size());
	ServicioLoadForosXML servicioLoadForos=new ServicioLoadForosXML();
	comentarios=servicioLoadForos.loadComentarios(equipos);

//	for(ComentarioEscale c:comentarios)
//	if(c.texto.length()>anchoMaximoComentario) anchoMaximoComentario=c.texto.length();
	

	
		transicionEscala = new TransicionEscala( font, comentarios, comentariosRepresentados, equipos);


	
	
}
void draw(){
	transicionEscala.escalayposiciona();
		image(mapa, 0, 0,width,height);
	
		for (int i = 0; i < comentariosRepresentados.size(); i++) {
			ComentarioEscalaMapa pintadoComentario = comentariosRepresentados.get(i);

			pintadoComentario.pinta( transicionEscala.getSumaTiempos(),transicionEscala.movs[0].timeFrames+(transicionEscala.movs[1].timeFrames/2));

			if (i > 0) {
				PintadoComentario comentarioAnterior = comentariosRepresentados.get(i - 1);
				noFill();
				strokeWeight(0.2);
				stroke(random(0,50));
				bezier(comentarioAnterior.x, comentarioAnterior.y, comentarioAnterior.x
						+ (pintadoComentario.x - comentarioAnterior.x) / 4 + random(-5, 1), comentarioAnterior.y
						- (pintadoComentario.y + comentarioAnterior.y) / 4, pintadoComentario.x
						- (pintadoComentario.x - comentarioAnterior.x) / 4, pintadoComentario.y
						- (pintadoComentario.y + comentarioAnterior.y) / 4, pintadoComentario.x, pintadoComentario.y);

			}
		}	
}





void loadEquipos(){
	equipos.add(new Equipo( 1, "bamako", 224, 122, "Niamakoro y Sicoro"));
	equipos.add(new Equipo( 2, "barcelona", 236, 55, "Casc Antic"));
	equipos.add(new Equipo( 3, "bogota", 133, 145, "Chapinero"));
	equipos.add(new Equipo( 4, "elalto", 141, 174, "Santa Rosa"));
	equipos.add(new Equipo( 5, "evry", 238, 39, "Pyramides"));
	equipos.add(new Equipo( 6, "montreuil", 243, 43, "Bel-Pêche"));
	equipos.add(new Equipo( 7, "palma", 241, 61, "Son Roca y Son Gotleu"));
	equipos.add(new Equipo( 8, "pikine", 210, 121, "Wakhinane"));
	equipos.add(new Equipo( 9, "rio", 175, 221, "La Maré y Rio das Pedras"));
	equipos.add(new Equipo( 10, "sale", 224, 72, "Karyan El Oued"));
	ArrayList listaColoresEquipo = new ServicioToxiColor().iniciaColoresEquiposBis();
	for (int i = 0; i < equipos.size(); i++){
		equipos.get(i).setColor(listaColoresEquipo.get(i));
	}
		

}

