class Mensaje  {
	float textWidtho;
	String mensaje;

	public Mensaje( PFont font, String mensaje, int tam) {
		this.mensaje = mensaje;
		textFont(font);
		textAlign(CENTER);
		textSize(tam);
		textWidtho = textWidth(mensaje)+5;
		textAscento = textAscent();
		log.info();
	}

	int contadorPintadoMensaje;
	float textAscento;
	boolean yaSaturado;

	void pintaMensaje( int colorTexto, int colorFondo, float x, float y, int tiempoDeComentario,
			int tiempoDeDelay) {
		if (yaSaturado && contadorPintadoMensaje < 1)
			return;
		if (contadorPintadoMensaje < tiempoDeDelay && !yaSaturado) {
			contadorPintadoMensaje++;
			return;
		}
		pushStyle();

		int limiteMaximoTransparencia = 100;
		int limiteInferiorTransp = limiteMaximoTransparencia - (limiteMaximoTransparencia / 4);
		if (yaSaturado)
			limiteInferiorTransp = 0;
		float transparencia = map(contadorPintadoMensaje, 0, tiempoDeComentario, limiteInferiorTransp,
				limiteMaximoTransparencia);

		if (transparencia > limiteMaximoTransparencia - 5) {
			yaSaturado = true;
		}
		fill(colorFondo, transparencia);
		noStroke();
		rect(x-4 - textWidtho / 2, y, textWidtho+6, textAscento);
		fill(colorTexto, transparencia);
		text(mensaje, x+2.5, y-2.5 + textAscento);
		popStyle();

		if (!yaSaturado)
			contadorPintadoMensaje++;
		else if (contadorPintadoMensaje > 0)
			contadorPintadoMensaje -= 3;

	}

}
