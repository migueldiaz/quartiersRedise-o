class ServicioLoadForosXML {
ArrayList loadComentarios(ArrayList equipos){
	ArrayList comentarios=new ArrayList();

	XMLElement xml = new XMLElement(this, "pde/foros.xml");
	int numSites = xml.getChildCount();
	XMLElement[] kids = xml.getChildren();
	//println("numero de elementos en " + kids.length);
	for (XMLElement el : kids) {
			String fecha = el.getChild("created-at").getContent();
			/* parsear fecha */
			String texto = el.getChild("textoes").getContent();
			String titulo = el.getChild("tituloes").getContent();
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
			
			
			ComentarioForo com=new ComentarioForo(idComentario, idComentarioParent, titulo,texto, usuario);
			usuario.addComentario(com);
			
			e.comentarios.add(com);
			comentarios.add(com);
	}
			return comentarios;
}

	Equipo getEquipo(int id, ArrayList equipos) {
		Equipo e = equipos.get(id - 1);
		return e;
	}

 
}
