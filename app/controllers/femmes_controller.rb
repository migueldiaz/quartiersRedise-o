class FemmesController < ApplicationController
 		layout 'quartiers'
 	
#GET /quartiers/agenda
def sitio
	@femmes=Femmes.first
		if @femmes.sitio.nil?
		@femmes.sitio=Sitio.create
		end
	@sitio=@femmes.sitio
	redirect_to sitio_path(:id=>@sitio)
end
	
	
def agenda
  		@femmes=Femmes.first
  		@sitio=@femmes.sitio
end
	
def proyectos
  		@femmes=Femmes.first
  		@red=@femmes.sitio.red
 
  		@pagina=@red.paginas.first
	   if !@pagina.nil?
  		redirect_to femmes_pagina_path(:id=>@pagina)
  	   end
end
	
def presentacion
  	@femmes=Femmes.first
  	@presentacion=@femmes.sitio.presentacion
  	@pagina=@presentacion.paginas.first
	if !@presentacion.paginas.nil? && !@pagina.nil?
  		redirect_to femmes_pagina_path(:id=>@pagina)
  	end
end
def documentacion
  	@femmes=Femmes.first
  	@documentacion=@femmes.sitio.documentacion
  	@pagina=@documentacion.paginas.first
	if !@documentacion.paginas.nil? && !@pagina.nil?
  		redirect_to femmes_pagina_path(:id=>@pagina)
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
		@femmes=@sitio.femmes
	    
end

def colaborador
		@femmes=Femmes.first
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
		@femmes=Femmes.first
  		@sitio=@femmes.sitio
		@aportan=@sitio.colaboradors.where('aporta'=>true)
		@noaportan=@sitio.colaboradors.where('aporta'=>false)
    
end
def agenda
    	
    	@femmes=Femmes.first
  		@sitio=@femmes.sitio
     	@eventos=@sitio.eventos
     	
end	
def contacto
    	@femmes=Femmes.first
  		@sitio=@femmes.sitio
     	@contacto=@sitio.contacto
    
 end
def equipos
    	@femmes=Femmes.first
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