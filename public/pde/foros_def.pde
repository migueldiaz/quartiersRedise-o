PFont fontA;
ArrayList comentarios;
ArrayList comentariosRepresentados= new ArrayList();
ArrayList equipos = new ArrayList();
ArrayList equiposRepresentados = new ArrayList();
float anchoComentario;
ArrayList filas;
int anchoMaximoComentario=0;
float altoBanda;
int framesPorComentario = 5;
Log log=new Log();
int altoCuadro=30;

void parar(){
	noLoop();
}
void reset(){
		comentariosRepresentados= new ArrayList();
	
	loop();
}

void setup(){
	log.debug("ahi vaaa");
	fontA=loadFont("Courier");
	colorMode(HSB, 100);
	background(0);
	size(800, 400);
	smooth();
	textFont(fontA, 50);  
	
	loadEquipos();	
	ServicioLoadForosXML servicioLoadForos=new ServicioLoadForosXML();
	comentarios=servicioLoadForos.loadComentarios(equipos);
	int numeroComentarios = comentarios.size();
	anchoComentario = width / numeroComentarios;
			for(ComentarioEscale c:comentarios)
			if(c.texto.length()>anchoMaximoComentario) anchoMaximoComentario=c.texto.length();
	
	filas = iniciaFilas();
	
	fill(1);
	text("setup realizado", 100,100);
	fill(1,0.5,0.7);
	text(comentarios.get(3).titulo, 300,300);
	fill(0.10,0.80,0.70);
	text("size equipos"+equipos.size(), 400,400);

		c1 = toxi.color.TColor.newRGB(random(100),0,0);
	altoBanda = height / equipos.size();
	
	
}
void draw(){
	background(100);
	pushStyle();
	noFill();
	strokeWeight(1);
	stroke(0);
	rect(1,1,width-2, height-2);
	popStyle();
	//rect(mouseX, mouseY, 100,100);
		boolean comprueba = compruebaTiempoDeAparicionComentario(framesPorComentario);
		pintaComentarios(false);
		pintaComentarios(true);
	if(comentariosRepresentados.size()>0 && comentariosRepresentados.size()!=comentarios.size()){
		ComentarioForo lastComentario=comentariosRepresentados.get(comentariosRepresentados.size()-1).comentario;
		fill(color(0),40);
		textSize(30);
		textFont(fontA, 30);
		rect(0, height/2-25, width,textAscent()+25);
		pintaMensaje(color(100),lastComentario.titulo, width/2, height/2-textAscent()/2, 30, CENTER);
	
	}
	pintaNombresEquipos();
}


	private void pintaComentarios(boolean linea) {
		int contadorLineas=1;
		pushStyle();
		strokeCap(SQUARE);

		int posicionX=200;
			float anchoCuadro=width/filas.size();
		for(Rectangulo r:comentariosRepresentados){
			//println(comentariosRepresentados.size());
			Fila f=dameFila(r.comentario.usuario.equipo);
			float transparenciaLinea=100;
			if(!f.ratonOn)
			transparenciaLinea= map(r.comentario.texto.length(), 30,anchoMaximoComentario, 30,50);
			else
			transparenciaLinea=100;			
			stroke(r.comentario.usuario.equipo.col,transparenciaLinea);
//			noStroke();
			float mapR = map(r.comentario.texto.length(), 30,anchoMaximoComentario, 10,60);
			strokeWeight(mapR);
			noFill();
			int ancho = 0;
			float puntoY=0;
			int posYLineaTiempo = height;
			if(r.y>posYLineaTiempo) puntoY=posYLineaTiempo+100;
			else 
				puntoY=posYLineaTiempo-100;
			//while(ancho<r.width){
			float fX = posicionX+mapR/2;
			
			if(!linea)
				  bezier(f.x+anchoCuadro/2, 20, 
						  fX-fX/2, puntoY, 
						  fX, puntoY, 
						  fX, posYLineaTiempo);
					stroke(color(0), 100);
					strokeWeight(1);
					if(linea)
						  bezier(f.x+anchoCuadro/2, 20, 
							  fX-fX/2, puntoY, 
							  fX, puntoY, 
							  fX, posYLineaTiempo);

//			line(0, r.y+r.height/2, r.x+ancho, (height/2));
			//ancho+=2;
			//}
			strokeWeight(1);
			//line(r.x, (height/2)+contadorLineas, width, (height/2)+contadorLineas);
//			line(posicion + anchoComentario, posicionY, posicion + anchoComentario, posicionY + Fila.height);

			rectanguloActual=r;
			contadorLineas+=5;
			posicionX+=mapR;
			
		}

		popStyle();
	}
	Fila dameFila(Equipo e){
		for(Fila f:filas)
			if(f.equipo.id==e.id)return f;
		return null;
	}

	public boolean compruebaTiempoDeAparicionComentario(int frames) {
		if ((frameCount % frames == 0) && (comentarios.size() != comentariosRepresentados.size())) {
			//println("comprobando!!!");
			ComentarioForo comentarioActual = comentarios.get(comentariosRepresentados.size());

			int idEquipo = comentarioActual.usuario.equipo.id;
			float posicion = (comentariosRepresentados.size()) * anchoComentario;
			float posicionY = (idEquipo - 1) * altoBanda;

			Rectangulo r = new Rectangulo( posicion, posicionY, anchoComentario, altoBanda, comentarioActual,framesPorComentario);
			comentariosRepresentados.add(r);
			rectanguloActual=r;
			Equipo inE = comentarioActual.usuario.equipo;
			inE.comentariosRepresentados.add(comentarioActual);
			boolean existeEquipo = equiposRepresentados.contains(inE);

			if (!existeEquipo) {
				equiposRepresentados.add(inE);
			}
			return true;
		}
		return false;
	}
	 void pintaMensaje(int c, String mensaje, float x, float y, int tam, int align) {
		noStroke();
		textAlign(align);
		fill(c);
		text(mensaje, x, y + textAscent());
	}

void mouseMoved() {
	if(mouseY<=altoCuadro){
		for (Fila f:filas) {
			if(mouseX>=f.x && mouseX<=f.x+(width/filas.size())){
				log.debug("estoy en alto de: "+f.equipo.nombre);
				f.ratonOn=true;
			}else{
				f.ratonOn=false;
			}
		}
	}else{
			muestraTituloForo();
	}

}
void mouseOut() {
		for (Fila f:filas) {
				f.ratonOn=false;
		}
}
void muestraTituloForo(){
	log.info("tituloForo");
	
}

	private void pintaNombresEquipos() {
		pushStyle();
		int numeroEquipos = filas.size();
		float anchoEquipo=width/numeroEquipos;
		int contador = 0;
		for (Fila f:filas) {
			Equipo equipo = f.equipo;
			textSize(22);
			textFont(fontA);
			fill(color(100));
			float anchoCuadro=width/filas.size();
			rect(f.x, 0, anchoCuadro, altoCuadro);
			stroke(equipo.col);
			if(f.ratonOn)
			fill(equipo.col,100);
			else
			fill(equipo.col,50);
			
			//textWidth(equipo.nombre.toUpperCase())+20
			rect(f.x, 0, anchoCuadro,altoCuadro);

			pintaMensaje(color(0), equipo.nombre.toUpperCase(), f.x+anchoCuadro/2, altoCuadro/2, 22, CENTER);

			contador++;
		}
		popStyle();
	}



	private ArrayList iniciaFilas() {
		ArrayList filas = new ArrayList();
		int numeroEquipos = equipos.size();
		float anchoEquipo=width/numeroEquipos;

		for (int i = 0; i < equipos.size(); i++) {
			Equipo equipo =  equipos.get(i);
			Fila fila=new Fila( anchoEquipo*i, i * altoBanda, width, altoBanda , equipo);
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

