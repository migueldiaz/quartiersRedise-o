class ServicioLoadEquiposXML {

	ArrayList procesaXML(String xmlFile){
			//	println(xmlFile);
	
		ArrayList equipos=new ArrayList();
		XMLElement xmlO = new XMLElement(this, xmlFile);
		int numSites = xmlO.getChildCount();
		XMLElement[] kids = xmlO.getChildren();
		
		
		//println("numero de elementos en " + kids.length);
			for (XMLElement el : kids) {
		//	log.debug(el);
				String nombre = el.getChild("nombre").getContent();
		//log.debug("eee"+nombre);
				int id = int(el.getChild("id").getContent());		
				Equipo equipo=new Equipo(id, nombre, nombre);
				equipos.add(equipo);
			}
		return equipos;
	}

 
}
