class NavegadorTemporalComentarios {

	List<ComentarioEscale> comentariosTime;
	private float widthComentarioTime;
	private  float _x;
	private int _y;
	private  float _width;
	private int altoComTime;

	public NavegadorTemporalComentarios(List<ComentarioEscale> comentariosOrdenadosFecha, float _x,  float _width ) {
		this._x = _x;
		this._width = _width;
		init(comentariosOrdenadosFecha);

	}
	public void init(List<ComentarioForo> comentariosOrdenadosFecha) {
		comentariosTime = comentariosOrdenadosFecha;
		int numeroComentarios = comentariosTime.size();
		
		 widthComentarioTime=this._width/numeroComentarios;
	}
	public void display(CeldaRet celdaSeleccionada) {
		for(int i=0; i<comentariosTime.size(); i++){
			ComentarioForo comentario = comentariosTime.get(i);
			fill(comentario.usuario.equipo.col);
			float posXComTime = i*widthComentarioTime+_x;
			altoComTime = 35;
			int inicioY = _y;
			if(comentario==celdaSeleccionada.comentario){
				inicioY=35;
			}else if(comentario.usuario==celdaSeleccionada.comentario.usuario){
				inicioY=35/3;
				//posXComTime+=widthComentarioTime/2;
			}
			rect(posXComTime, inicioY, widthComentarioTime, altoComTime);
		}
		
	}

	public ComentarioForo mouseClick(int mouseX, int mouseY) {
		if(mouseY>0 && mouseY<altoComTime){
		if(mouseX>_x && mouseX<(_x+_width)){
			int pos=(int) ((mouseX-_x)/widthComentarioTime);
			log.info("pos: "+pos);
			ComentarioForo comentarioTimeSel = comentariosTime.get(pos);
			log.debug(comentarioTimeSel.texto);
			return comentarioTimeSel;
		}
	}
		return null;
	}

}
