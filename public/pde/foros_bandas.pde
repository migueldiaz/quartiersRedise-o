PFont fontA;
ArrayList comentarios;
ArrayList comentariosRepresentados= new ArrayList();
ArrayList equipos = new ArrayList();
ArrayList equiposRepresentados = new ArrayList();
//float anchoComentario;
ArrayList filas;
int anchoMaximoComentario=0;
float altoBanda;
int framesPorComentario = 75;
Log log=new Log();
	float anchoComentario;
void parar(){
	//comentariosRepresentados= new ArrayList();
	noLoop();
}
void reset(){
		log.info("try reset!");
		 comentariosRepresentados= new ArrayList();
 equipos = new ArrayList();
 equiposRepresentados = new ArrayList();
		
	loop();
}
void setup(){
	log.debug("ahi vaaa");
	fontA=loadFont("Courier");
	colorMode(HSB, 100);
	background(100);
	size(800, 400);
	smooth();
	textFont(fontA, 36);  
	
	loadEquipos();	
	log.debug("equipos size::: "+equipos.size());
	ServicioLoadForosXML servicioLoadForos=new ServicioLoadForosXML();
	comentarios=servicioLoadForos.loadComentarios(equipos);
	int numeroComentarios = comentarios.size();
	anchoComentario = width / numeroComentarios;
	//		for(ComentarioEscale c:comentarios)
		//	if(c.texto.length()>anchoMaximoComentario) anchoMaximoComentario=c.texto.length();
	
	altoBanda = height / equipos.size();
	filas = iniciaFilas();
	


	
	
}
void draw(){
	background(100);
			boolean comprueba = compruebaTiempoDeAparicionComentario(framesPorComentario);
		pintaReticulaEquipos();
		pintaComentarios();
		if (comprueba || (rectanguloActual != null && rectanguloActual.isPintando())) {
		log.debug(rectanguloActual.comentario.titulo);
			rectanguloActual.pinta();
			pintaMensaje(color(0), rectanguloActual.comentario.titulo, 250, rectanguloActual.y+rectanguloActual.heighto/2, 20, LEFT);
		}
		pintaNombresEquipos();
}

private void pintaComentarios() {
		pushStyle();
		for(RectanguloBanda r:comentariosRepresentados){
			fill(r.comentario.usuario.equipo.col, 50);
			noStroke();
			rect(r.x, r.y, anchoComentario, altoBanda);
			stroke(100, 50);
			strokeWeight(3);
//			line(posicion + anchoComentario, posicionY, posicion + anchoComentario, posicionY + Fila.height);

			rectanguloActual=r;
		}

		popStyle();
	}

private void pintaReticulaEquipos() {

		pushStyle();
		for (Fila f:filas) {
			EquipoEscale equipo = f.equipo;
		//	float transparencia = map(equipo.comentariosRepresentados.size(), 0, equipo.comentarios.size(), 15, 45);
			// println(equipo.nombre+"="+transparencia);
			// fill(equipo.color, transparencia);
			stroke(0);
			strokeWeight(1);
			noStroke();
			fill(equipo.col,20);
			rect(f.x, f.y , f.width, f.height);

		}
		popStyle();
	}
	private void pintaNombresEquipos() {
		
		pushStyle();
		for (Fila f:filas) {
			EquipoEscale equipo = f.equipo;
			fill(100);
			int tam=12;
			textSize(tam);
			textFont(fontA);
			noStroke();
			rect(100-10, f.y+(f.height/2)-10, textWidth(equipo.nombre)+20, textAscent()+20);
			pintaMensaje(color(0), equipo.nombre.toUpperCase(), 100, f.y+(f.height/2),  tam, LEFT);
			
		}
		popStyle();
	}

	 void pintaMensaje(int c, String mensaje, float x, float y,  int tam, int align) {
		textSize(tam);
		textFont(fontA, tam);
		fill(0);
		noStroke();
		textAlign(align);
		// g.rect(x, y, textWidth(mensaje), textAscent());
		fill(c);
		text(mensaje, x, y + textAscent());
	}

	RectanguloBanda rectanguloActual;

	private boolean compruebaTiempoDeAparicionComentario(int frames) {
		if ((frameCount % frames == 0) && (comentarios.size() != comentariosRepresentados.size())) {
			ComentarioForo comentarioActual = comentarios.get(comentariosRepresentados.size());

			int idEquipo = comentarioActual.usuario.equipo.id;
			float posicion = (comentariosRepresentados.size()) * anchoComentario;
			float posicionY = (idEquipo - 1) * altoBanda;

			RectanguloBanda r = new RectanguloBanda( posicion, posicionY, anchoComentario, altoBanda, comentarioActual, framesPorComentario);

			comentariosRepresentados.add(r);
			rectanguloActual=r;
			Equipo inE = comentarioActual.usuario.equipo;
			inE.comentariosRepresentados.add(comentarioActual);
			boolean existeEquipo = equipos.contains(inE);

			if (!existeEquipo) {
				equipos.add(inE);
			}
			return true;

		}
		return false;
	}

	private ArrayList iniciaFilas() {
		ArrayList filas = new ArrayList();
		int numeroEquipos = equipos.size();
		float anchoEquipo=width/numeroEquipos;

		for (int i = 0; i < equipos.size(); i++) {
			Equipo equipo =  equipos.get(i);
			Fila fila=new Fila( 0, i * altoBanda, width, altoBanda , equipo);
			filas.add(fila);
		}
		return filas;
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

