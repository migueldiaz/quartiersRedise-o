class TraductorController < ApplicationController
	layout 'mono'
	before_filter :require_traductor
    

	def index
	#if current_user.tipo!='traductor'
	 #redirect_to trafico_url
	#end
	
	#Idioma secciones
	#Idioma foros
	@imagenes=Imagen.all
	if current_user.traduceA=='es'   
		@imagenesSinTraducir = Imagen.find(:all, :conditions => "piefoto = '' ")
	    @imagenesSinRevisar = Imagen.find(:all, :conditions => "revisado = false")
	else
	    @imagenesSinTraducir = Imagen.find(:all, :conditions => "piefotofr = ''")
	    @imagenesSinRevisar = Imagen.find(:all, :conditions => "revisadofr = false")
	end
	
	#Idioma foros
	@foros=Foro.all
	if current_user.traduceA=='es'   
		@forosSinTraducir = Foro.find(:all, :conditions => "tituloes = '' ")
	    @forosSinRevisar = Foro.find(:all, :conditions => "revisado = false")
	else
	    @forosSinTraducir = Foro.find(:all, :conditions => "titulofr = ''")
	    @forosSinRevisar = Foro.find(:all, :conditions => "revisadofr = false")
	end
	#Idioma Comentarios
	@comentarios=Comentario.all
	if current_user.traduceA=='es'   
		@comentariosSinTraducir = Comentario.find(:all, :conditions => "textoes = '' || tituloes = '' ")
	    @comentariosSinRevisar = Comentario.find(:all, :conditions => "revisado = false")
	else
	    @comentariosSinTraducir = Comentario.find(:all, :conditions => "textofr = '' || titulofr = ''")
	    @comentariosSinRevisar = Comentario.find(:all, :conditions => "revisadofr = false")
	end
	
	#Idioma Colaboradores
	@colaboradores=Colaborador.all
	if current_user.traduceA=='es'   
		@colaboradorSinTraducir = Colaborador.find(:all, :conditions => "nombreEs = '' || infoEs = ''")
	    @colaboradorSinRevisar = Colaborador.find(:all, :conditions => "revisado = false")
	else
	    @colaboradorSinTraducir = Colaborador.find(:all, :conditions => "nombreFr = '' || infoFr = ''")
	    @colaboradorSinRevisar = Colaborador.find(:all, :conditions => "revisadofr = false")
	end
	    
	#Idioma Contactos
	@contactos=Contacto.all
	if current_user.traduceA=='es'   
		@contactosSinTraducir = Contacto.find(:all, :conditions => "infoEs = ''" )
		@contactosSinRevisar = Contacto.find(:all, :conditions => "revisado = false")
	else
	    @contactosSinTraducir = Contacto.find(:all, :conditions => "infoFr=''")
		@contactosSinRevisar = Contacto.find(:all, :conditions => "revisadofr = false")
	end
	    
	#Idioma Documentos
	@documentos=Documento.all
	if current_user.traduceA=='es'   
		@documentosSinTraducir = Documento.find(:all, :conditions => "docEs = '' || archivo = '' " )
		@documentosSinRevisar = Documento.find(:all, :conditions => "revisado = false")
	else
		@documentosSinTraducir = Documento.find(:all, :conditions => "docFr=''|| archivofr = ''")
	    @documentosSinRevisar = Documento.find(:all, :conditions => "revisadofr = false")
	end
	   
	#Idioma Equipos
	@equipos=Equipo.all
	if current_user.traduceA=='es'   
		@equiposSinTraducir = Equipo.find(:all, :conditions => "descripcionEs = ''" )
		@equiposSinRevisar = Equipo.find(:all, :conditions => "revisado = false")
	else
	    @equiposSinTraducir = Equipo.find(:all, :conditions => "descripcionFr=''")
		@equiposSinRevisar = Equipo.find(:all, :conditions => "revisadofr = false")
	end
	   
	   
	#Idioma Eventos
	@eventos=Evento.all
	if current_user.traduceA=='es'   
		@eventosSinTraducir = Evento.find(:all, :conditions => "tituloEs = ''" )
		@eventosSinRevisar = Evento.find(:all, :conditions => "revisado = false")
	else
		@eventosSinTraducir = Evento.find(:all, :conditions => "tituloFr=''")
		@eventosSinRevisar = Evento.find(:all, :conditions => "revisadofr = false")
	end
	   
	#Idioma Paginas
	@paginas=Pagina.all
	if current_user.traduceA=='es'   
		@paginasSinTraducir = Pagina.find(:all, :conditions => "tituloes = ''" )
		@paginasSinRevisar = Pagina.find(:all, :conditions => "revisado = false")
	else
		@paginasSinTraducir = Pagina.find(:all, :conditions => "titulofr=''")
		@paginasSinRevisar = Pagina.find(:all, :conditions => "revisadofr = false")
	end
	#Idioma Parrafos
	@parrafos=Parrafo.all
	if current_user.traduceA=='es'   
		@parrafosSinTraducir = Parrafo.find(:all, :conditions => "textoes = '' || piefoto = '' ||tituloes='' 			&& titulofr!='' " )
		@parrafosSinRevisar = Parrafo.find(:all, :conditions => "revisado = false")
	else
		@parrafosSinTraducir = Parrafo.find(:all, :conditions => "textofr='' || piefotofr = ''  ||
		tituloes='' && titulofr!='' ")
		@parrafosSinRevisar = Parrafo.find(:all, :conditions => "revisadofr = false")
	end
	
	   
	  
  end
end
