class FemmesController < ApplicationController
 		layout 'quartiers'
 	
#GET /quartiers/agenda
def sitio
	@web=Web.first
  	@femmes=@web.femmes
		if @femmes.sitio.nil?
		@femmes.sitio=Sitio.create
		end
	@sitio=@femmes.sitio
	redirect_to sitio_path(:id=>@sitio)
end
	
	
def agenda
  		@web=Web.first
  		@femmes=@web.femmes
  		@sitio=@femmes.sitio
end
	
def proyectos
  		@web=Web.first
  		@femmes=@web.femmes
  		@red=@femmes.sitio.red
 
  		@pagina=@red.paginas.first
	   if !@pagina.nil?
  		redirect_to femmes_pagina_path(:id=>@pagina)
  	   end
end
	
def presentacion
  	@web=Web.first
  	@femmes=@web.femmes
  	@presentacion=@femmes.sitio.presentacion
  	@pagina=@presentacion.paginas.first
	if !@presentacion.paginas.nil? && !@pagina.nil?
  		redirect_to femmes_pagina_path(:id=>@pagina)
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
		@femmes=@sitio.femmes
	    
end

def colaborador
		@web=Web.first
  		@femmes=@web.femmes
  		@sitio=@femmes.sitio
		@aportan=@sitio.colaboradors.where('aporta'=>true)
		@noaportan=@sitio.colaboradors.where('aporta'=>false)
end

def agenda
    	
    	@web=Web.first
  		@femmes=@web.femmes
  		@sitio=@femmes.sitio
     	@eventos=@sitio.eventos
end
def colaborador
		@web=Web.first
  		@femmes=@web.femmes
  		@sitio=@femmes.sitio
		@aportan=@sitio.colaboradors.where('aporta'=>true)
		@noaportan=@sitio.colaboradors.where('aporta'=>false)
    
end
def agenda
    	
    	@web=Web.first
  		@femmes=@web.femmes
  		@sitio=@femmes.sitio
     	@eventos=@sitio.eventos
     	
end	
def contacto
    	@web=Web.first
  		@femmes=@web.femmes
  		@sitio=@femmes.sitio
     	@contacto=@sitio.contacto
    
 end
def equipos
    	@web=Web.first
  		@femmes=@web.femmes
  		@equipos=@femmes.equipos
  		@sitio=@femmes.sitio
end
def equipo
       @equipo=Equipo.find(params[:id])
      
       @femmes=@equipo.femmes
       @equipos=femmes.equipos
       
       @sitio=@equipo.sitio
       if !@sitio.presentacion.nil?
         @seccion=@sitio.presentacion.seccion
         @pagina=@seccion.paginas.first  
         if !@seccion.nil?
          redirect_to femmes_pagina_path(:id=>@agina) 
     
         end
       end
end
end
