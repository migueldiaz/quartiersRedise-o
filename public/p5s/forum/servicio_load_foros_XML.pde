class ServicioLoadForosXML {


	  List<Equipo> equipos;
	public ServicioLoadForosXML( List<Equipo> equipos) {
		this.equipos = equipos;
	}

	ArrayList procesaXML(String xmlFile){
	ArrayList comentarios=new ArrayList();

	XMLElement xml = new XMLElement(this, xmlFile);
	int numSites = xml.getChildCount();
	XMLElement[] kids = xml.getChildren();
	//println("numero de elementos en " + kids.length);
	int contador=0;
	for (XMLElement el : kids) {
	contador++;
	
			String fecha = el.getChild("created-at").getContent();
			/* parsear fecha */
			String texto = el.getChild("texto"+locale).getContent();
			String texto_alternativo = el.getChild("texto"+otro_locale).getContent();
			String titulo = el.getChild("titulo"+locale).getContent();
			String titulo_alternativo = el.getChild("titulo"+otro_locale).getContent();
			int idComentario = int(el.getChild("id").getContent());		
			String idComentarioParentString = el.getChild("comentario-id").getContent();
			int idComentarioParent = 0;
				if (idComentarioParentString != null) {
					idComentarioParent = int(idComentarioParentString);
				}
			int idEquipo = el.getChild("usuarioforo").getChild("equipo-id").getContent();

			Equipo e = getEquipo(idEquipo, equipos);

			String nombreUsuario = el.getChild("usuarioforo").getChild("nombre").getContent();
			String mailUsuario = el.getChild("usuarioforo").getChild("email").getContent();
			int idUsuario = el.getChild("usuarioforo").getChild("id").getContent();

			
			Usuario usuario = new Usuario(idUsuario, nombreUsuario,	mailUsuario, e);
			usuario = e.addUsuario(usuario);
			
			
			ComentarioForo com=new ComentarioForo(idComentario, idComentarioParent, titulo,texto,titulo_alternativo,texto_alternativo, usuario);
			usuario.addComentario(com);
			
			e.comentarios.add(com);
			comentarios.add(com);
	}
				//println("saliendo de comentarios"+contador);
	
			return comentarios;
}
	

	Equipo getEquipo(int id, ArrayList equipos) {
	for(Equipo e:equipos){
		if(e.id==id) return e;
	}
	return equipos.get(0);
	}

 
}
