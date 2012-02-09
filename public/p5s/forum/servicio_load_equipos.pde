class ServicioLoadEquipos {

	List<Equipo> equipos;
	ServicioLoadForosXML forosXMLLoad;
		ServicioLoadEquiposXML loadEquipos=new ServicioLoadEquiposXML();
	toxi.color.TColor colorQDM; 
	
	public ServicioLoadEquipos(String xmlEquipos) {
			equipos=loadEquipos.procesaXML(xmlEquipos);
			// println(equipos);   
			ServicioToxiColor stc=new ServicioToxiColor();
			ArrayList listaColoresEquipo = stc.iniciaColoresEquiposBis();
			for (int i = 0; i < equipos.size(); i++){
				equipos.get(i).setColor(listaColoresEquipo.get(i));
			}
			 Equipo equipoQDM=new Equipo(999,"QDM", "QDM");
			 equipoQDM.setColor(stc.dameColorQDM());
			 equipos.add(equipoQDM);
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