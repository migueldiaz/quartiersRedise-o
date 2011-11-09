class PintadoComentario {

	ComentarioForo comentario;
	 float ancho;
	 float alto;
	 float x;
	 float y;
	 Mensaje tituloMensaje;
	 Mensaje equipoMensaje;

	public PintadoComentario(ComentarioForo comentarioEscale, PFont font) {
		comentario = comentarioEscale;
		ancho += map(comentario.texto.split(" ").length, 0, 200, 0, 20);
		alto = ancho;
		x=comentario.usuario.equipo.x+random(-5,5);
		y=comentario.usuario.equipo.y+random(-5,5);
		tituloMensaje=new Mensaje( font ,comentario.titulo,9);
		equipoMensaje=new Mensaje( font,comentario.usuario.equipo.nombre,9);
		
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
		
		fill(comentario.usuario.equipo.col, transparencia);

		float anchoActualPintado = map(contadorTiempoPintado, 0, tiempoDeComentario, ancho/2, ancho);
		ellipse(x, y,  anchoActualPintado, anchoActualPintado);
		popStyle();
		
		equipoMensaje.pintaMensaje( color(limiteTransparencia), comentario.usuario.equipo.col,  x, y+(alto/2),   tiempoDeComentario+(tiempoDeComentario/2), _delay);
		tituloMensaje.pintaMensaje( color(limiteTransparencia), color(0),  x,y+(alto/2)+equipoMensaje.textAscento,   tiempoDeComentario+(tiempoDeComentario/2), _delay);
	
		if(!yaAlcanzadoExtremo)
			contadorTiempoPintado++;
		else
			if(contadorTiempoPintado>(tiempoDeComentario/2))
				contadorTiempoPintado--;

	}
 
}
