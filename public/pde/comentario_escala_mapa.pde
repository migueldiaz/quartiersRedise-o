class ComentarioEscalaMapa extends ComentarioForo{

	 float ancho;
	 float alto;
	 float x;
	 float y;
	 Mensaje tituloMensaje;
	 Mensaje equipoMensaje;

	public ComentarioEscalaMapa( ComentarioForo comentarioEscale, PFont font) {
		super( comentarioEscale.id, comentarioEscale.parent, comentarioEscale.titulo, comentarioEscale.texto, comentarioEscale.usuario);
		ancho += map(texto.split(" ").length, 0, 200, 0, 20);
		alto = ancho;
		x=usuario.equipo.x+random(-5,5);
		y=usuario.equipo.y+random(-5,5);
		tituloMensaje=new Mensaje( font ,titulo,9);
		equipoMensaje=new Mensaje( font,usuario.equipo.nombre,9);
		
	}
	
	float contadorTiempoPintado;
	boolean yaAlcanzadoExtremo;
	public void pinta( int tiempoDeComentario, int _delay) {
		pushStyle();
		int limiteTransparencia = 100;
		stroke(limiteTransparencia);
		strokeWeight(0.2);

		float transparencia = map(contadorTiempoPintado, 0, tiempoDeComentario, 15, limiteTransparencia);
		if(transparencia>(limiteTransparencia-5)) yaAlcanzadoExtremo=true;
		
		fill(usuario.equipo.col, transparencia);

		float anchoActualPintado = map(contadorTiempoPintado, 0, tiempoDeComentario, ancho/2, ancho);
		ellipse(x, y,  anchoActualPintado, anchoActualPintado);
		popStyle();
		
		equipoMensaje.pintaMensaje( color(limiteTransparencia), usuario.equipo.col,  x, y+(alto/2),   tiempoDeComentario+(tiempoDeComentario/2), _delay);
		tituloMensaje.pintaMensaje( color(limiteTransparencia), color(0),  x,y+(alto/2)+equipoMensaje.textAscento,   tiempoDeComentario+(tiempoDeComentario/2), _delay);
	
		if(!yaAlcanzadoExtremo)
			contadorTiempoPintado++;
		else
			if(contadorTiempoPintado>(tiempoDeComentario/2))
				contadorTiempoPintado--;

	}
 
}
