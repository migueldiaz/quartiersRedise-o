class Equipo {
	int id;
	String nombre;
	color col;
	String barrio;
	List<Usuario> usuarios = new ArrayList<Usuario>();
	List<ComentarioForo> comentarios=new ArrayList<ComentarioForo>();
	public Equipo(int id, String nombre, String barrio){
		this.id=id;
		this.nombre=nombre;
		this.barrio=barrio;
	}
	
	
	public Usuario addUsuario(Usuario u) {
		for (Usuario usu : usuarios)
			if (usu.id == u.id)
				return usu;
		usuarios.add(u);

		return u;
	}	
 	public void setColor(toxi.color.TColor tColor) {
		col = color(mapeaValor(tColor.hue()), mapeaValor(tColor.saturation()),
				mapeaValor(tColor.brightness()));
	}
 	protected float mapeaValor(float ta) {
	return map(ta, 0, 1, 0, 100);
	}
 
}
