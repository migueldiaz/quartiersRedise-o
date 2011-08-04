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
	def presentacion
  		@web=Web.first
  		@jeunes=@web.jeunes
  		@sitio=@jeunes.sitio
  		@seccion=@sitio.presentacion.seccions.first

  		redirect_to jeunes_seccion_path(:id=>@seccion)
	end
	def proyecto
  		@web=Web.first
  		@jeunes=@web.jeunes
  		@sitio=@jeunes.sitio
  		@seccion=@sitio.presentacion.seccions.first
  		redirect_to jeunes_seccion_path(:id=>@seccion)
	end
	
	def seccion
 		@seccion=Seccion.find(params[:id])
 		@paginas=@seccion.paginas
    	
    	if !@seccion.presentacion.nil?
    	  @sitio=@seccion.presentacion.sitio
    	else
    	  @sitio=@seccion.red.sitio
    	end
    	
    	@jeunes=@sitio.jeunes
    	#@asociacion=Web.first.asociacion.sitio
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
         @seccion=@sitio.presentacion .seccions.first  
         if !@seccion.nil?
          redirect_to jeunes_seccion_path(:id=>@seccion) 
     
         end
       end
    end
end
