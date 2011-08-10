class JeunesController < ApplicationController
 	layout 'quartiers'
 	
#GET /quartiers/agenda
def sitio
  	@jeunes=Jeunes.first
		if @jeunes.sitio.nil?
		@jeunes.sitio=Sitio.create
		end
	@sitio=@jeunes.sitio
	redirect_to sitio_path(:id=>@sitio)
end
def foros
	@jeunes=Jeunes.first
	@foros=@jeunes.sitio.foros
end
def foro
	@foro=Foro.find(params[:id])
	@jeunes=@foro.sitio.jeunes
	@foros=@jeunes.sitio.foros
end
	
def agenda
  		@jeunes=Jeunes.first
  		@sitio=@jeunes.sitio
end
	
def proyectos
  		@jeunes=Jeunes.first
  		@red=@jeunes.sitio.red
 
  		@pagina=@red.paginas.first
	   if !@pagina.nil?
  		redirect_to jeunes_pagina_path(:id=>@pagina)
  	   end
end
	
def presentacion
  	@jeunes=Jeunes.first
  	@presentacion=@jeunes.sitio.presentacion
  	@pagina=@presentacion.paginas.first
	if !@presentacion.paginas.nil? && !@pagina.nil?
  		redirect_to jeunes_pagina_path(:id=>@pagina)
  	end
end
def documentacion
  	@jeunes=Jeunes.first
  	@documentacion=@jeunes.sitio.documentacion
  	@pagina=@documentacion.paginas.first
	if !@documentacion.paginas.nil? && !@pagina.nil?
  		redirect_to jeunes_pagina_path(:id=>@pagina)
  	end
end

def pagina
		@pagina=Pagina.find(params[:id])
		
		if !@pagina.presentacion.nil?
		    @sitio=@pagina.presentacion.sitio
	  		@presentacion=@sitio.presentacion
		    @paginas=@presentacion.paginas
		elsif !@pagina.red.nil?
	  		@sitio=@pagina.red.sitio
	  		@red=@sitio.red
	  		@paginas=@red.paginas
		else
			@sitio=@pagina.documentacion.sitio
	  		@documentacion=@sitio.documentacion
	  		@paginas=@documentacion.paginas
		
		end
		@jeunes=@sitio.jeunes
	    
end

def colaborador
		@jeunes=Jeunes.first
  		@sitio=@jeunes.sitio
		@aportan=@sitio.colaboradors.where('aporta'=>true)
		@noaportan=@sitio.colaboradors.where('aporta'=>false)
end

def agenda
    	
    	@web=Web.first
  		@jeunes=@web.jeunes
  		@sitio=@jeunes.sitio
     	@eventos=@sitio.eventos
     	
end	

def contacto
    	@web=Web.first
  		@jeunes=@web.jeunes
  		@sitio=@jeunes.sitio
     	@contacto=@sitio.contacto
    
end

def equipos
    	@web=Web.first
  		@jeunes=@web.jeunes
  		@equipos=@jeunes.equipos
  		@sitio=@jeunes.sitio
end

def equipo
  @equipo=Equipo.find(params[:id])
  @jeunes=@equipo.jeunes
  @equipos=jeunes.equipos
  @sitio=@equipo.sitio
  redirect_to equipe_sitio_path(:id=>@sitio)  
end
end