class AsociationController < ApplicationController
 	layout 'quartiers'
 	
#GET /quartiers/agenda
	def agenda
  		@web=Web.first
  		@asociacion=@web.asociacion
  		@sitio=@asociacion.sitio
	end
	def proyectos
  		@web=Web.first
  		@asociacion=@web.asociacion
  		@red=@asociacion.sitio.red
  		@seccion=@red.seccion
  		@pagina=@seccion.paginas.first

  		redirect_to asociation_pagina_path(:id=>@pagina)
	end
	
	def presentacion
  		@web=Web.first
  		@asociacion=@web.asociacion
  		@presentacion=@asociacion.sitio.presentacion
  		@seccion=@presentacion.seccion
  		@pagina=@seccion.paginas.first

  		redirect_to asociation_pagina_path(:id=>@pagina)
	end
	def pagina
		@pagina=Pagina.find(params[:id])
		@seccion=@pagina.seccion
		if !@seccion.presentacion.nil?
	  		@sitio=@seccion.presentacion.sitio
	  		@presentacion=@seccion.presentacion
		else
	  		@sitio=@seccion.red.sitio
	  		@red=@sitio.red
		end
		@asociacion=@sitio.asociacion
	    @paginas=@seccion.paginas
	end
	
	
	
	def asociacion
  		@web=Web.first
  		@asociation=@web.asociacion
  		@sitio=@asociacion.sitio
  		@seccion=@sitio.presentacion.seccions.first
  		redirect_to asociation_seccion_path(:id=>@seccion)
	end
	
	def seccion
 		@seccion=Seccion.find(params[:id])
 		@paginas=@seccion.paginas
    	
    	if !@seccion.presentacion.nil?
    	  @sitio=@seccion.presentacion.sitio
    	else
    	  @sitio=@seccion.red.sitio
    	end
    	
    	@asociacion=@sitio.asociacion
    	#@asociacion=Web.first.asociacion.sitio
	end
	def colaborador
		@web=Web.first
  		@asociacion=@web.asociacion
  		@sitio=@asociacion.sitio
		@aportan=@sitio.colaboradors.where('aporta'=>true)
		@noaportan=@sitio.colaboradors.where('aporta'=>false)
    
    end
    def agenda
    	
    	@web=Web.first
  		@asociacion=@web.asociacion
  		@sitio=@asociacion.sitio
     	@eventos=@sitio.eventos
     	
     end	
    def contacto
    	@web=Web.first
  		@asociacion=@web.asociacion
  		@sitio=@asociacion.sitio
     	@contacto=@sitio.contacto
    
    end
   
   
end
