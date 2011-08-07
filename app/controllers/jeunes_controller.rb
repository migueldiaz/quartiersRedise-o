class JeunesController < ApplicationController
 	layout 'quartiers'
 	
#GET /quartiers/agenda
def sitio
	@web=Web.first
  	@jeunes=@web.jeunes
		if @jeunes.sitio.nil?
		@jeunes.sitio=Sitio.create
		end
	@sitio=@jeunes.sitio
	redirect_to sitio_path(:id=>@sitio)
end
	
	
def agenda
  		@web=Web.first
  		@jeunes=@web.jeunes
  		@sitio=@jeunes.sitio
end
	
def proyectos
  		@web=Web.first
  		@jeunes=@web.jeunes
  		@red=@jeunes.sitio.red
 
  		@pagina=@red.paginas.first
	   if !@pagina.nil?
  		redirect_to jeunes_pagina_path(:id=>@pagina)
  	   end
end
	
def presentacion
  	@web=Web.first
  	@jeunes=@web.jeunes
  	@presentacion=@jeunes.sitio.presentacion
  	@pagina=@presentacion.paginas.first
	if !@presentacion.paginas.nil? && !@pagina.nil?
  		redirect_to jeunes_pagina_path(:id=>@pagina)
  	end
end

def pagina
		@pagina=Pagina.find(params[:id])
		
		if !@pagina.presentacion.nil?
		    @sitio=@pagina.presentacion.sitio
	  		@presentacion=@sitio.presentacion
		    @paginas=@presentacion.paginas
		else
	  		@sitio=@pagina.red.sitio
	  		@red=@sitio.red
	  		@paginas=@red.paginas
		end
		@jeunes=@sitio.jeunes
	    
end

def colaborador
		@web=Web.first
  		@jeunes=@web.jeunes
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
