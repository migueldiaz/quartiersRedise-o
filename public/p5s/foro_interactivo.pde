Log log=new Log();
PFont font;
ReticulaRet reticulaRet;
NavegadorUsuarios navegadorUsuarios;
NavegadorTemporalComentarios navegadorTemporalComentarios;
NavegadorTamanyos navegadorTamanyos;
public void reset(){
	log.info("parandosss desde javascript to process");
	
}
public void newComentario( String texto,  String otro_texto){
String traduccion="";
if(isTraductor()){
traduccion="&comentario[revisado]=1&comentario[revisadofr]=1&comentario[texto"+otro_locale+"]="+otro_texto+"&comentario[titulo"+otro_locale+"]="+otro_texto.substring(0,10)
}
String comentarioParentVar="&comentario[comentario_id]="+reticulaRet.celdaSeleccionada.comentario.id;
if(comentarioPrincipal){
comentarioParentVar="";
comentarioPrincipal=false;
}
	//println("comentarioAntID:"+reticulaRet.celdaSeleccionada.comentario.id+":::"+titulo+"---"+texto+"________from p5s");
	$.ajax({
	  type: "POST",
	  url: "/comentarios",
	    beforeSend: function( xhr ) {
    xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
  },
	  data: "forito=true"+comentarioParentVar+"&comentario[usuarioforo_id]="+usuarioforo_id+"&comentario[foro_id]="+idForo+traduccion+"&comentario[texto"+locale+"]="+texto+"&comentario[titulo"+locale+"]="+texto.substring(0,10)
	}).fail(function() { alert("error SENDING MESSAGE FORUM \n contact webmaster: juanantonioruz@gmail.com"); })
	.done(function( msg ) {
	//println("se fini la comunicacion"+msg);
	//  alert( "Data Saved: " + msg );
	  refresca();
	  reticulaRet.seleccionaComentarioPorID(msg);
	});
	
}


public void tradComentario( String texto,  String otro_texto){
String traduccion="";
if(isTraductor()){
traduccion="&comentario[revisado]=1&comentario[revisadofr]=1&comentario[texto"+otro_locale+"]="+otro_texto+"&comentario[titulo"+otro_locale+"]="+otro_texto.substring(0,10)
}

	//println("comentarioAntID:"+reticulaRet.celdaSeleccionada.comentario.id+":::"+titulo+"---"+texto+"________from p5s");
	$.ajax({
	  type: "POST",
	  url: "/comentarios/update",
	    beforeSend: function( xhr ) {
    xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
  },
	  data: "forito=true&id="+reticulaRet.celdaSeleccionada.comentario.id+traduccion+"&comentario[texto"+locale+"]="+texto+"&comentario[titulo"+locale+"]="+texto.substring(0,10)
	}).fail(function() { alert("error SENDING MESSAGE FORUM \n contact webmaster: juanantonioruz@gmail.com"); })
	.done(function( msg ) {
	//println("se fini la comunicacion"+msg);
	 // alert( "Data Saved: " + msg );
	  setup();
	  reticulaRet.seleccionaComentarioPorID(msg);
	});
	
}


public boolean isTraductor(){
return isUsuarioForoAdmin();
}
public boolean isUsuarioForoAdmin(){
if(
usuario_mail.equals("juanantonioruz@gmail.com") || 
usuario_mail.equals("migueldiazgajete@gmail.com") ||
usuario_mail.equals("jennifer.quintas@quartiersdumonde.org") ||
usuario_mail.equals("ada.bazan@quartiersdumonde.org") ||
usuario_mail.equals("natalia.resimont@quartiersdumonde.org") ||
usuario_mail.equals("carine.troussel@quartiersdumonde.org") 
){
return true;
}else{
return false;
}
}

public String getIdioma(){
	if(locale=='es') return "Español";
	else return "Français";
}
public String getOtroIdioma(){
	if(otro_locale=='es') return "Español";
	else return "Français";

}

int idForo;
int usuarioforo_id;
String locale;
String usuario_mail;
String otro_locale;
int tamTexto=13;
void setup(){
	font=loadFont("Courier");
//textMode(SCREEN);	
textFont(font, tamTexto); 
	hint(DISABLE_OPENGL_2X_SMOOTH);
	colorMode(HSB, 100);
	background(80);
	//size(800, 600);
		size($(window).width(), $(window).height());
	//smooth();
	  idForo = Request.parameter('id');
	  locale = Request.parameter('idioma');
	  usuario_mail = Request.parameter('usuario_mail');
	  usuario_mail=usuario_mail.replaceFirst("%40", "@");
	  
	  if(locale=="es") otro_locale="fr";
	  else otro_locale="es";
	  usuarioforo_id = Request.parameter('usuarioforo_id');
	 var equiposSitio = Request.parameter('equipos');
	// println("usuarioForo_id"+usuarioforo_id);
	reticulaRet = new ReticulaRet("/"+equiposSitio+"/equipos.xml", "../foros/"+idForo+".xml",200, 80, width - 220, height-90);
	navegadorUsuarios=new NavegadorUsuarios(reticulaRet.usuarios, reticulaRet.getHeight(), reticulaRet.getX(), reticulaRet.getY());
	navegadorTemporalComentarios=new NavegadorTemporalComentarios(reticulaRet.comentariosOrdenadosFecha, reticulaRet.getX(),  reticulaRet.getWidth());
	navegadorTamanyos=new NavegadorTamanyos();
}
void refresca(){
		CeldaRet c=reticulaRet.celdaSeleccionada;
			  setup();
	  reticulaRet.seleccionaComentarioPorID(c.comentario.id);
		/*
		reticulaRet.incluyeXML("/comentarios/nuevos/"+reticulaRet.dameUltimoIdComentario()+".xml",c.comentario);
		navegadorTemporalComentarios.init(reticulaRet.comentariosOrdenadosFecha);
		navegadorUsuarios.init(reticulaRet.usuarios);
		log.info("alla va!");
		r.reset();
		*/
}

Refresco r=new Refresco();
void draw(){
	background(100);
	if(frameCount%(30*30)==0){
		refresca();
	}
	r.display();
	
	noStroke();
	reticulaRet.display();
	fill(10);	
	//textSize(tamTexto);
	log.info("mensajes:"+reticulaRet.mensajes.size(),100,100);
	log.info("usuarios:"+reticulaRet.usuarios.size(),100,120);
	
	navegadorUsuarios.display(reticulaRet.celdaSeleccionada);
	navegadorTemporalComentarios.display(reticulaRet.celdaSeleccionada);

	navegadorTamanyos.display();
	
	
		
}

	public void mouseClicked() {
	  if ((mouseButton == LEFT)) {
	  	int res=navegadorTamanyos.mouseClick(mouseX, mouseY);
	  	if(res==1 && tamTexto>9)	tamTexto--;
	  	else if(res==2) 	tamTexto++;
	  	textFont(font,tamTexto);
	  	
	//selecciona	
			reticulaRet.raton(mouseX, mouseY);
			ComentarioForo u=navegadorUsuarios.mouseClick(mouseX, mouseY);
		if(u!=null) reticulaRet.selecciona(u);
		ComentarioForo com=navegadorTemporalComentarios.mouseClick(mouseX, mouseY);
		if(com!=null) reticulaRet.selecciona(com);

	  }else if  ((mouseButton == RIGHT)){
	nuevoComentario(false);	  
	  }
	
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
	nuevoComentario(false);		
		}else if(key=='x' && isUsuarioForoAdmin()){
	nuevoComentario(true);		
		}else if(key=='t' && isTraductor() ){
		ComentarioForo cf=reticulaRet.celdaSeleccionada.rectangleConTexto.comentario;
		openModalTraducir(cf.texto, cf.texto_alternativo);
		}else if(key=='a'){
		ComentarioForo cf=reticulaRet.celdaSeleccionada.rectangleConTexto.comentario;
		openModalDetalle(cf.texto);
		}
	}
boolean comentarioPrincipal=false;
void nuevoComentario(boolean parentC){
		if(parentC)
		comentarioPrincipal=true;
		ComentarioForo comentarioSeleccionado=reticulaRet.celdaSeleccionada.comentario;
		String t=comentarioSeleccionado.texto;
		int idComentarioSeleccionado=comentarioSeleccionado.id;
		String respondiendoA=comentarioSeleccionado.usuario.nombre;
		if(comentarioPrincipal){
		 t= "comentario principal !!";
		idComentarioSeleccionado= 0;
		 respondiendoA= "";
		 }
		  openModal(idComentarioSeleccionado,respondiendoA, t);
	
}

int dameColor(String hex){
			tColor=toxi.color.TColor.newHex(hex);
			int coloritx = color(mapeaValor(tColor.hue()), mapeaValor(tColor.saturation()),
				mapeaValor(tColor.brightness()));
return coloritx;
}
 	protected float mapeaValor(float ta) {
	return map(ta, 0, 1, 0, 100);
	}
