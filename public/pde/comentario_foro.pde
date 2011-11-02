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
	}
	
	public void pinta(){
		rect(100,100,100,100);
	}
 
}
