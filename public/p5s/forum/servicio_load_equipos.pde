class ServicioLoadEquipos {

	List<Equipo> equipos;
	ServicioLoadForosXML forosXMLLoad;
		ServicioLoadEquiposXML loadEquipos=new ServicioLoadEquiposXML();
	
	public ServicioLoadEquipos() {
		String urlE="../p5s/equipos_femmes.xml";
		//log.debug(urlE);
			equipos=loadEquipos.procesaXML(urlE);
			// println(equipos);   
			ArrayList listaColoresEquipo = new ServicioToxiColor().iniciaColoresEquiposBis();
			for (int i = 0; i < equipos.size(); i++){
				equipos.get(i).setColor(listaColoresEquipo.get(i));
			}
			 forosXMLLoad = new ServicioLoadForosXML(equipos);
	}
	
	
	public List<ComentarioForo> loadXML(String xmlFile){
		List<ComentarioForo> comentarios = forosXMLLoad.procesaXML(xmlFile);
		//Collections.reverse(comentarios);
		List apoyo=new ArrayList();
		for(int j=comentarios.size()-1; j>=0; j--){
		apoyo.add(comentarios.get(j));
		}
		return apoyo;
}
	
}