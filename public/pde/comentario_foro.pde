class ComentarioForo {
	int x;
	int y;
	color col;
	String titulo;
	String texto;
	int parent;
	int id;
	Usuario usuario;
	public ComentarioForo(int id, int parent, String titulo,String texto, Usuario usuario){
		this.id=id;
		this.parent=parent;
		this.titulo=titulo;
		this.texto=texto;
		this.usuario=usuario;
		
		// para escale
		x=usuario.equipo.x+random(-1,1);
		y=usuario.equipo.y+random(-1,1);
		col=color(random(1), random(1));
		
	}
	
	public void pinta(){
		println("intentando pintar comentario");
	}
 
}
