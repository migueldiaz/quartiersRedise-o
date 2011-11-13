class Fila {
	float x;
	float y;
	float width;
	 float height;
	Equipo equipo;
	ArrayList rectangulos = new ArrayList();
	boolean ratonOn;
	public Fila(float x, float y, float width, float height, Equipo equipo) {
		this.x = x;
		this.y = y;
		this.width = width;
		this.height = height;
		this.equipo = equipo;
	}
 
}
