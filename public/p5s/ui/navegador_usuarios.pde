class NavegadorUsuarios {
	private  float _height;
	List<UsuarioForo> usuariosForo;
	float heightUsuarioBox;
	private float _y;
	private float _x;

	public NavegadorUsuarios( List<UsuarioForo> usuarios, float _height, float _x, float _y) {
		usuariosForo = usuarios;
		this._height = _height;
		this._x = _x;
		this._y = _y;
				init(usuarios);
		
	}
public void init(List<UsuarioForo> usuarios) {
		// TODO Collections.sort(usuariosForo, new ComparatorEquipoUsuario());
		int numeroUsuarios = usuarios.size();
		heightUsuarioBox = this._height / numeroUsuarios;
	}
	public void display(CeldaRet celdaSeleccionada) {
		for(int j=0; j<usuariosForo.size(); j++){
			UsuarioEscale usu=usuariosForo.get(j);
			float posY=j*heightUsuarioBox+_y;
			int colorFondo;
			int colorTexto;
			if(usu==celdaSeleccionada.comentario.usuario){
				colorFondo=usu.equipo.col;
				colorTexto=100;
			}else{
				colorFondo=100;
				colorTexto=usu.equipo.col;
				
			}
			fill(colorFondo);
			noStroke();
			rect(0, posY, _x-50, heightUsuarioBox);
			fill(usu.equipo.col);
			rect(0, posY, heightUsuarioBox, heightUsuarioBox);
			textSize(10);
			fill(100);
			text("["+usu.comentarios.size()+"]", 1, posY+heightUsuarioBox/2);
			fill(colorTexto);
			text(usu.nombre, heightUsuarioBox+5, posY+heightUsuarioBox/2);
		}		
	}

	public ComentarioEscale mouseClick(int mouseX, int mouseY) {
		if(mouseX<_x && mouseX>0)
			if(mouseY>_y && mouseY<(_y+_height)){
				int posUsuario=(int) ((mouseY-_y)/heightUsuarioBox);
				UsuarioForo usuarioForo = usuariosForo.get(posUsuario);
				log.info("click en usuarios"+posUsuario+" usu: "+usuarioForo);
				List<ComentarioForo> comentarios = usuarioForo.comentarios;
				// TODO : Collections.sort(comentarios, new ComparatorFecha());
				return comentarios.get(0);
			}
		return null;
	}


}
