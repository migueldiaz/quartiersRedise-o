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
  		@seccion=@sitio.presentacion.seccion
     	@pagina=@seccion.paginas.first
  	   redirect_to equipe_pagina_path(:id=>@pagina)
	end
	
	
	def pagina
 		@pagina=Pagina.find(params[:id])
 		@seccion=@pagina.seccion
 		@paginas=@seccion.paginas
    	
    	if !@seccion.presentacion.nil?
    	  @presentacion=@seccion.presentacion
    	  @sitio=@presentacion.sitio
    	else
    	  @red=@seccion.red
    	  @sitio=@red.sitio
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
   		@equipo=Equipo.find(params[:id])
  		@red=@equipo.sitio.red
  		@seccion=@red.seccion
  		@pagina=@seccion.paginas.first

  		redirect_to equipe_pagina_path(:id=>@pagina)
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
