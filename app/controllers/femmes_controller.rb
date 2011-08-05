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
  		@seccion=@red.seccion
  		@pagina=@seccion.paginas.first

  		redirect_to femmes_pagina_path(:id=>@pagina)
	end
	
	def presentacion
  		@web=Web.first
  		@femmes=@web.femmes
  		@presentacion=@femmes.sitio.presentacion
  		@seccion=@presentacion.seccion
  		@pagina=@seccion.paginas.first

  		redirect_to femmes_pagina_path(:id=>@pagina)
	end
	def pagina
		@pagina=Pagina.find(params[:id])
		@seccion=@pagina.seccion
		if !@seccion.presentacion.nil?
	  		@sitio=@seccion.presentacion.sitio
		    @presentacion=@sitio.presentacion
		else
	  		@sitio=@seccion.red.sitio
		    @red=@sitio.red
		end
		@femmes=@sitio.femmes
	    @paginas=@seccion.paginas
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
