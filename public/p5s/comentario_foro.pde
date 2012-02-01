class ComentarioForo {
	String titulo;
	String texto;
	String titulo_alternativo;
	String texto_alternativo;
	int parent;
	int id;
	Usuario usuario;
	List<ComentarioForo> children=new ArrayList();
	public ComentarioForo(int id, int parent, String titulo,String texto,String titulo_alternativo,String texto_alternativo, Usuario usuario){
		this.id=id;
		this.parent=parent;
		this.titulo=titulo;
		this.texto=texto;
		this.titulo_alternativo=titulo_alternativo;
		this.texto_alternativo=texto_alternativo;
		this.usuario=usuario;
	}
	public String dameTextoI18N(){
		if(texto!=null) return texto;
		return texto_alternativo;
	}

	public String dameTituloI18N(){
			if(titulo!=null) return titulo;
		return titulo_alternativo;
	
	}
	public boolean estaTraducido(){
		return (titulo!=null && texto != null);
	}
 
}
