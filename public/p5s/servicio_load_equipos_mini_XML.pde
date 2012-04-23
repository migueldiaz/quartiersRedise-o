class ServicioLoadEquiposMiniXML {

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
				float cx = float(el.getChild("x").getContent());		
				float cy = float(el.getChild("y").getContent());		
				EquipoMini equipo=new EquipoMini(id, nombre, cx, cy);
				equipos.add(equipo);
			}
		return equipos;
	}
 

}
