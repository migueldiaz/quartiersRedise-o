class ServicioEscala {

	 List  equipos;
	 List  comentariosRepresentados;

	public ServicioEscala( List  equipos, List  comentariosRepresentados) {
		this.equipos = equipos;
		this.comentariosRepresentados = comentariosRepresentados;
	}


	public  Escala calculaEscala(boolean soloUltimo, int widtho, int heighto) {

		float equilibrio = 30;
		float _dameX1 = dameX1(soloUltimo) - equilibrio;
		float _dameX2 = dameX2(soloUltimo) + equilibrio;
		float _dameY1 = dameY1(soloUltimo) - equilibrio;
		float _dameY2 = dameY2(soloUltimo) + equilibrio;

		float anchoRepresentar = _dameX2 - _dameX1;
		float altoRepresentar = _dameY2 - _dameY1;
		float escalaProvX = (widtho / anchoRepresentar);
		float escalaProvY = (heighto / altoRepresentar);
		float incremento = dameIncremento(escalaProvX, escalaProvY);

		float origenX = _dameX1 + (anchoRepresentar / 2);
		float origenY = _dameY1 + (altoRepresentar / 2);
		log.debug("origenX" + origenX + " origenY" + origenY);
		Escala escalaActual = new Escala(incremento, origenX, origenY);

		return escalaActual;

	}

	
	float dameIncremento(float x, float y) {
		if (x > y)
			return y;
		return x;
	}




	float dameX1(boolean soloUltimo) {
		if (soloUltimo)
			return dameEquipoDeUltimoComent().x - margenHorizontal();

		float resultado = width;
		for (EquipoEscale e : equipos) {
			if (e.x < resultado)
				resultado = e.x;
		}
		return resultado- margenHorizontal();
	}


	private float margenHorizontal() {
		return comentariosRepresentados.get(comentariosRepresentados.size() - 1).tituloMensaje.textWidtho/2+40;
	}
	private float margenVertical() {
		PintadoComentario pintadoComentario = comentariosRepresentados.get(comentariosRepresentados.size() - 1);
		return pintadoComentario.tituloMensaje.textAscento+pintadoComentario.alto;
	}

	private EquipoEscale dameEquipoDeUltimoComent() {
		return comentariosRepresentados.get(comentariosRepresentados.size() - 1).usuario.equipo;
	}


	float dameX2(boolean soloUltimo) {
		if (soloUltimo)
			return dameEquipoDeUltimoComent().x + margenHorizontal();
		float resultado = 0;
		for (EquipoEscale e : equipos) {
			if (e.x > resultado)
				resultado = e.x;
		}
		return resultado+ margenHorizontal();
	}

	float dameY1(boolean soloUltimo) {
		if (soloUltimo)
			return dameEquipoDeUltimoComent().y - margenVertical();
		float resultado = height;
		for (EquipoEscale e : equipos) {
			if (e.y < resultado)
				resultado = e.y;
		}
		return resultado- margenVertical();
	}

	float dameY2(boolean soloUltimo) {
		if (soloUltimo)
			return dameEquipoDeUltimoComent().y + margenVertical();
		float resultado = 0;
		for (EquipoEscale e : equipos) {
			if (e.y > resultado)
				resultado = e.y;
		}
		return resultado+ margenVertical();
	}
}
