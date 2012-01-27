class ComentarioForo {
	String titulo;
	String texto;
	int parent;
	int id;
	Usuario usuario;
	List<ComentarioForo> children=new ArrayList();
	public ComentarioForo(int id, int parent, String titulo,String texto, Usuario usuario){
		this.id=id;
		this.parent=parent;
		this.titulo=titulo;
		this.texto=texto;
		this.usuario=usuario;
	}
	

 
}
