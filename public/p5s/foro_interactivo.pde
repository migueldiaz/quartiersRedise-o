Log log=new Log();
PFont font;
ReticulaRet reticulaRet;
NavegadorUsuarios navegadorUsuarios;
NavegadorTemporalComentarios navegadorTemporalComentarios;

public void reset(){
	log.info("parandosss desde javascript to process");
	
}
public void newComentario(String titulo, String texto){
	println("comentarioAntID:"+reticulaRet.celdaSeleccionada.comentario.id+":::"+titulo+"---"+texto+"________from p5s");
}
void setup(){
//	font=loadFont("Courier");
//textMode(SCREEN);	
//textFont(font, 180); 
	hint(DISABLE_OPENGL_2X_SMOOTH);
	colorMode(HSB, 100);
	background(80);
	//size(800, 600);
		size($(window).width(), $(window).height());
	//smooth();
	 var idForo = Request.parameter('id');
	 var usuarioforo_id = Request.parameter('usuarioforo_id');
	 var equiposSitio = Request.parameter('equipos');
	// println("usuarioForo_id"+usuarioforo_id);
	reticulaRet = new ReticulaRet("/"+equiposSitio+"/equipos.xml", "../foros/"+idForo+".xml",200, 80, width - 220, height-90);
	navegadorUsuarios=new NavegadorUsuarios(reticulaRet.usuarios, reticulaRet.getHeight(), reticulaRet.getX(), reticulaRet.getY());
	navegadorTemporalComentarios=new NavegadorTemporalComentarios(reticulaRet.comentariosOrdenadosFecha, reticulaRet.getX(),  reticulaRet.getWidth());

}
Refresco r=new Refresco();
void draw(){
	background(100);
	if(frameCount%(30*30)==0){
		CeldaRet c=reticulaRet.celdaSeleccionada;
		reticulaRet.incluyeXML("/comentarios/nuevos/"+reticulaRet.dameUltimoIdComentario()+".xml",c.comentario);
		navegadorTemporalComentarios.init(reticulaRet.comentariosOrdenadosFecha);
		navegadorUsuarios.init(reticulaRet.usuarios);
		log.info("alla va!");
		r.reset();
	}
	r.display();
	
	noStroke();
	reticulaRet.display();
	fill(10);	
	//textFont(font,102);
	log.info("mensajes:"+reticulaRet.mensajes.size(),100,100);
	log.info("usuarios:"+reticulaRet.usuarios.size(),100,120);
	navegadorUsuarios.display(reticulaRet.celdaSeleccionada);
	navegadorTemporalComentarios.display(reticulaRet.celdaSeleccionada);
	
		
}

	public void mouseClicked() {
			reticulaRet.raton(mouseX, mouseY);
			ComentarioForo u=navegadorUsuarios.mouseClick(mouseX, mouseY);
		if(u!=null) reticulaRet.selecciona(u);
		ComentarioForo com=navegadorTemporalComentarios.mouseClick(mouseX, mouseY);
		if(com!=null) reticulaRet.selecciona(com);
	
	}
public void keyPressed() {
		 if(keyCode==UP){
			log.debug("UP!");
			reticulaRet.selectUP();
		}else if(keyCode==DOWN){
			reticulaRet.selectDOWN();
			log.debug("DOWN");
		}else if(keyCode==LEFT){
			reticulaRet.selectLEFT();
			log.debug("LEFT");
		}else if(keyCode==RIGHT){
			reticulaRet.selectRIGHT();
			log.debug("RIGHT");
		}else if(key=='r'){
			log.info("RESET!");
			reticulaRet.reset();

			
		}else if(key=='c'){
		ComentarioForo comentarioSeleccionado=reticulaRet.celdaSeleccionada.comentario;
		String t=comentarioSeleccionado.texto;
		String tt=t.substring(50);
		  openModal(comentarioSeleccionado.id,comentarioSeleccionado.usuario.nombre, comentarioSeleccionado.titulo,comentarioSeleccionado.texto);
		
		}
	}



