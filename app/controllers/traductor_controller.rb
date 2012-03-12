class TraductorController < ApplicationController
	layout 'mono'
	before_filter :require_traductor
    

	def index
	#if current_user.tipo!='traductor'
	 #redirect_to trafico_url
	#end
	
	
	#Idioma Comentarios
	@comentarios=Comentario.all
	@comentariosST = Comentario.find(:all, :conditions => "textofr = '' || textoes='' ")
	@comentariosSR = Comentario.find(:all, :conditions => "revisadofr = false || revisado=false")
	
	#Idioma imagenes
	@imagenes=Imagen.all
	@imagenesSinTraducir = Imagen.find(:all, :conditions => "piefoto = '' || piefotofr = ''")
	@imagenesSinRevisar = Imagen.find(:all, :conditions => "revisado = false || revisadofr=false")
	
	
	#Idioma foros
	@foros=Foro.all
	@forosSinTraducir = Foro.find(:all, :conditions => "tituloes = '' || titulofr='' ")
    @forosSinRevisar = Foro.find(:all, :conditions => "revisado = false || revisadofr=false")

	
	
	#Idioma Colaboradores
	@colaboradores=Colaborador.all
	@colaboradorSinTraducir = Colaborador.find(:all, :conditions => "nombreEs = '' || infoEs = '' || nombreFr = '' || infoFr = ''")
	@colaboradorSinRevisar = Colaborador.find(:all, :conditions => "revisado = false || revisadofr=false")

	    
	#Idioma Contactos
	@contactos=Contacto.all 
	@contactosSinTraducir = Contacto.find(:all, :conditions => "infoEs = '' || descripciones='' || infoFr='' || descripcionfr=''" )
	@contactosSinRevisar = Contacto.find(:all, :conditions => "revisado = false || revisadofr=false")
	
	    
	#Idioma Documentos
	@documentos=Documento.all 
	@documentosSinTraducir = Documento.find(:all, :conditions => "docEs = '' || archivo = '' || docFr=''|| archivofr = '' " )
	@documentosSinRevisar = Documento.find(:all, :conditions =>  "revisado = false || revisadofr=false")
	
	   
	#Idioma Equipos
	@equipos=Equipo.all
	@equiposSinTraducir = Equipo.find(:all, :conditions => " descripcionEs = '' || descripcionFr=''")
	@equiposSinRevisar = Equipo.find(:all, :conditions => "revisado = false || revisadofr=false")
	   
	   
	#Idioma Eventos
	@eventos=Evento.all
	@eventosSinTraducir = Evento.find(:all, :conditions => "tituloEs = '' || descripciones='' ||tituloFr='' || descripciones=''")
	@eventosSinRevisar = Evento.find(:all, :conditions => "revisado = false || revisadofr=false")
	
	   
	#Idioma Paginas
	@paginas=Pagina.all
	@paginasSinTraducir = Pagina.find(:all, :conditions => "tituloes = '' || titulofr=''" )
	@paginasSinRevisar = Pagina.find(:all, :conditions => "revisado = false || revisadofr=false")
	
	#Idioma Parrafos
	@parrafos=Parrafo.all 
	@parrafosSinTraducir = Parrafo.find(:all, :conditions => "textoes = '' || textofr = ''" )
	@parrafosSinRevisar = Parrafo.find(:all, :conditions => "revisado = false || revisadofr=false")
	
	
	   
	  
  end
end
