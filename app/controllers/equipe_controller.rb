class EquipeController < ApplicationController
 	layout 'quartiers'
 	
#GET /quartiers/agenda
	def sitio
		@equipo=@Equipo.find(params[:id])
		if !@equipo.jeunes.nil?
  		  @jeunes=@equipo.jeunes
  		else
  		 @femmes=@equipo.femmes
  		end
	    redirect_to equipo_presentacion_path(@equipo)
	
	end
	
	
	
	def agenda
  		@equipo=@Equipo.find(params[:id])
  		if !@equipo.jeunes.nil?
  		  @jeunes=@equipo.jeunes
  		  @equipos=@jeunes.equipos
  		else
  		 @femmes=@equipo.femmes
  		 @equipos=@femmes.equipos
  		end
  		@sitio=@equipo.sitio
	end
	def presentacion
  		@equipo=Equipo.find(params[:id])
     
        @sitio=@equipo.sitio
  		@seccion=@sitio.presentacion.seccions.first
    
  	   redirect_to equipe_seccion_path(:id=>@seccion)
	end
	
	
	def seccion
 		@seccion=Seccion.find(params[:id])
 		@paginas=@seccion.paginas
    	
    	if !@seccion.presentacion.nil?
    	  @sitio=@seccion.presentacion.sitio
    	else
    	  @sitio=@seccion.red.sitio
    	end
    		@equipo=@sitio.equipo   	
    	 if !@equipo.jeunes.nil?
    	 @jeunes=@equipo.jeunes
    	else
    	  @femmes=@equipo.femmes
    	end
	end
	def colaborador
		@equipo=Equipo.find(params[:id])
        @sitio=@equipo.sitio
		@aportan=@sitio.colaboradors.where('aporta'=>true)
		@noaportan=@sitio.colaboradors.where('aporta'=>false)
        if !@equipo.jeunes.nil?
         @jeunes=@equipo.jeunes
        else
         @femmes=@equipo.femmes
        end
    
    end
    def actividades
    # OJO AQUI, Se tienen que mostrar los proyectos
    end
    def agenda
    	
    	@equipo=Equipo.find(params[:id])
  		if !@equipo.jeunes.nil?
  		  @jeunes=@equipo.jeunes
  		 # @equipos=@jeunes.equipos
  		else
  		 @femmes=@equipo.femmes
  		 @equipos=@femmes.equipos
  		end
  		@sitio=@equipo.sitio
     	@eventos=@sitio.eventos
     end	
    def contacto
    	@equipo=Equipo.find(params[:id])
  		
  		if !@equipo.jeunes.nil?
  		  @jeunes=@equipo.jeunes
  		else
  		 @femmes=@equipo.femmes
  		end
  		@sitio=@equipo.sitio
     	@contacto=@sitio.contacto
    
    end
   
   
end
