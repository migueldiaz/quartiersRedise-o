class AsociationController < ApplicationController
 	layout 'juan'
 	
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
  		@pagina=@red.paginas.first
 		if !@pagina.nil?
  		redirect_to asociation_pagina_path(:id=>@pagina)
		end
	end
	
	def presentacion
  		@web=Web.first
  		@asociacion=@web.asociacion
  		@presentacion=@asociacion.sitio.presentacion
  		@pagina=@presentacion.paginas.first
       if !@pagina.nil?
  		redirect_to asociation_pagina_path(:id=>@pagina)
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
		@asociacion=@sitio.asociacion
	    
	end
	
	
	
	def asociacion
  		#@web=Web.first
  		#@asociation=@web.asociacion
  		
  		redirect_to asociation_presentacion_path(:id=>@seccion)
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
