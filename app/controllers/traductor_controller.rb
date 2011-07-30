class TraductorController < ApplicationController
	layout 'mono'
	def index
	if !current_user.tipo=='traductor'
	 redirect_to trafico_url
	end
	
	
	#Idioma Colaboradores
	    @colaboradores=Colaborador.all
	   if current_user.traduceA=='es'   
		 @colaboradorSinTraducir = Colaborador.find(:all, :conditions => "nombreEs = '' || infoEs=''")
	   else
	     @colaboradorSinTraducir = Colaborador.find(:all, :conditions => "nombreFr = '' || infoFr=''")
	   end
	     @colaboradorSinRevisar = Colaborador.find(:all, :conditions => "revisado <> true")
	 #Idioma Contactos
	  @contactos=Contacto.all
	   if current_user.traduceA=='es'   
		 @contactosSinTraducir = Contacto.find(:all, :conditions => "infoEs = ''" )
	   else
	     @contactosSinTraducir = Contacto.find(:all, :conditions => "infoFr=''")
	   end
	   @contactosSinRevisar = Contacto.find(:all, :conditions => "revisado <> true")
	   
	   #Idioma Documentos
	   @documentos=Documento.all
	   if current_user.traduceA=='es'   
		 @documentosSinTraducir = Documento.find(:all, :conditions => "docEs = ''" )
	   else
	     @documentosSinTraducir = Documento.find(:all, :conditions => "docFr=''")
	   end
	   @documentosSinRevisar = Documento.find(:all, :conditions => "revisado <> true")
	   
	   #Idioma Equipos
	    @equipos=Equipo.all
	   if current_user.traduceA=='es'   
		 @equiposSinTraducir = Equipo.find(:all, :conditions => "descripcionEs = ''" )
	   else
	     @equiposSinTraducir = Equipo.find(:all, :conditions => "descripcionFr=''")
	   end
	   @equiposSinRevisar = Equipo.find(:all, :conditions => "revisado <> true")
	   
	   #Idioma Eventos
	    @eventos=Evento.all
	   if current_user.traduceA=='es'   
		 @eventosSinTraducir = Evento.find(:all, :conditions => "tituloEs = ''" )
	   else
	     @eventosSinTraducir = Evento.find(:all, :conditions => "tituloFr=''")
	   end
	   @eventosSinRevisar = Evento.find(:all, :conditions => "revisado <> true")
	   
	    #Idioma Paginas
	    @paginas=Pagina.all
	   if current_user.traduceA=='es'   
		 @paginasSinTraducir = Pagina.find(:all, :conditions => "tituloes = ''" )
	   else
	     @paginasSinTraducir = Pagina.find(:all, :conditions => "titulofr=''")
	   end
	   @paginasSinRevisar = Pagina.find(:all, :conditions => "revisado <> true")
	   
	    #Idioma Parrafos
	    @parrafos=Parrafo.all
	   if current_user.traduceA=='es'   
		 @parrafosSinTraducir = Parrafo.find(:all, :conditions => "textoes = ''" )
	   else
	     @parrafosSinTraducir = Parrafo.find(:all, :conditions => "textofr=''")
	   end
	   @parrafosSinRevisar = Parrafo.find(:all, :conditions => "revisado <> true")
	   
	    #Idioma Secciones
	    @secciones=Seccion.all
	   if current_user.traduceA=='es'   
		 @seccionesSinTraducir = Seccion.find(:all, :conditions => "tituloes = ''" )
	   else
	     @seccionesSinTraducir = Seccion.find(:all, :conditions => "titulofr=''")
	   end
	   @seccionesSinRevisar = Seccion.find(:all, :conditions => "revisado <> true")
	   
	   
	    
	end
end
