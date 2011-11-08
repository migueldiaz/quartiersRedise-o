class Equipo {
	int widthEscala = 500;
	int heightEscala = 319;

	int x;
	int y;
	String barrio;
	String nombre;
	  int id;
	ArrayList comentarios = new ArrayList();
	ArrayList comentariosRepresentados = new ArrayList();
	ArrayList usuarios = new ArrayList();

	public Equipo(int id, String nombre, int x, int y, String barrio){
		this.id=id;
		this.nombre=nombre;
		this.barrio=barrio;
		this.x = map(x, 0, widthEscala, 0, width);
		this.y = map(y, 0, heightEscala, 0, height);
	}
	
	public void pinta(){
		rect(100,100,100,100);
	}
	
	public Usuario addUsuario(Usuario u) {
		for (Usuario usu : usuarios)
			if (usu.id == u.id)
				return usu;
		usuarios.add(u);

		return u;
	}
	color col;
	
 	public void setColor(toxi.color.TColor tColor) {
		col = color(mapeaValor(tColor.hue()), mapeaValor(tColor.saturation()),
				mapeaValor(tColor.brightness()));
	}
 	protected float mapeaValor(float ta) {
	return map(ta, 0, 1, 0, 100);
	}
 
}
