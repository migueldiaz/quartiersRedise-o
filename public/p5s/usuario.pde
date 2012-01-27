class Usuario {

	int id;
	String nombre;
	String mail;
	Equipo equipo;
	ArrayList comentarios = new ArrayList();
	ArrayList comentariosRepresentados = new ArrayList();

	public Usuario(int id, String nombre, String mail, Equipo equipo){
		this.id=id;
		this.nombre=nombre;
		this.mail=mail;
		this.equipo=equipo;
	}
	
	public void pinta(){
		rect(100,100,100,100);
	}
	
 	public void addComentario(ComentarioForo c) {
		comentarios.add(c);
	}
 
 
  	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (nombre == null) {
			if (obj.nombre != null)
				return false;
		} else if (!nombre.equals(obj.nombre))
			return false;
		return true;
	}
 
}
