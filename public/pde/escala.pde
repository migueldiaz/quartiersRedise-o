class  Escala {
	public Escala(float incremento, float origenX, float origenY) {
		scale = incremento;
		x = origenX;
		y = origenY;
	}
	public Escala(Escala escalaSiguiente) {
		this(escalaSiguiente.scale, escalaSiguiente.x, escalaSiguiente.y);
	}

	float scale;
	float x;
	float y;

}
