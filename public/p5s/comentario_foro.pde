class ComentarioForo {
	String texto;
	String texto_alternativo;
	int parent;
	int id;
	Usuario usuario;
	List<ComentarioForo> children=new ArrayList();
	public ComentarioForo(int id, int parent, String texto,String texto_alternativo, Usuario usuario){
		this.id=id;
		this.parent=parent;
		this.texto=texto;
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
		return (texto != null);
	}
 
 	public boolean necesitaTraduccion(){
		return (texto == null || texto_alternativo ==null);
	}
}
