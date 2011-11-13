class Mensaje  {
	float textWidtho;
	String mensaje;

	public Mensaje( PFont font, String mensaje, int tam) {
		this.mensaje = mensaje;
		textFont(font, tam);
		textAlign(CENTER);
		textSize(tam);
		textWidtho = textWidth(mensaje)+5;
		textAscento = textAscent()+5;
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
		rect(x - textWidtho / 2, y-(textAscento/2), textWidtho, textAscento);
		fill(colorTexto, transparencia);
		text(mensaje, x, y+(textAscento/2)-2);
		popStyle();

		if (!yaSaturado)
			contadorPintadoMensaje++;
		else if (contadorPintadoMensaje > 0)
			contadorPintadoMensaje -= 3;

	}

}
