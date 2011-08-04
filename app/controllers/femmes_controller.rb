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
	def presentacion
  		@web=Web.first
  		@femmes=@web.femmes
  		@sitio=@femmes.sitio
  		@seccion=@sitio.presentacion.seccions.first

  		redirect_to femmes_seccion_path(:id=>@seccion)
	end
	def proyecto
  		@web=Web.first
  		@femmes=@web.femmes
  		@sitio=@femmes.sitio
  		@seccion=@sitio.presentacion.seccions.first
  		redirect_to femmes_seccion_path(:id=>@seccion)
	end
	
	def seccion
 		@seccion=Seccion.find(params[:id])
 		@paginas=@seccion.paginas
    	
    	if !@seccion.presentacion.nil?
    	  @sitio=@seccion.presentacion.sitio
    	else
    	  @sitio=@seccion.red.sitio
    	end
    	
    	@femmes=@sitio.femmes
    	#@asociacion=Web.first.asociacion.sitio
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
    end
    def equipo
       @equipo=Equipo.find(params[:id])
      
       @femmes=@equipo.femmes
       @equipos=femmes.equipos
       
       @sitio=@equipo.sitio
       if !@sitio.presentacion.nil?
         @seccion=@sitio.presentacion .seccions.first  
         if !@seccion.nil?
          redirect_to femmes_seccion_path(:id=>@seccion) 
     
         end
       end
    end
end
