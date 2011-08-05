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
  		@seccion=@red.seccion
  		@pagina=@seccion.paginas.first

  		redirect_to jeunes_pagina_path(:id=>@pagina)
	end
	
	def presentacion
  		@web=Web.first
  		@jeunes=@web.jeunes
  		@presentacion=@jeunes.sitio.presentacion
  		@seccion=@presentacion.seccion
  		@pagina=@seccion.paginas.first

  		redirect_to jeunes_pagina_path(:id=>@pagina)
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
		@jeunes=@sitio.jeunes
	    @paginas=@seccion.paginas
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
       if !@sitio.presentacion.nil?
         @seccion=@sitio.presentacion.seccion
         @pagina=@seccion.paginas.first  
         if !@seccion.nil?
          redirect_to jeunes_pagina_path(:id=>@agina) 
     
         end
       end
    end
end
