class EquipeController < ApplicationController
 #	layout 'juan_equipe'
 	 layout 'juan_equipe' 
 
#selecciona mujer y si no coge por defecto el de jovenes
  def segun_proyecto
    if @equipo.jeunes.nil?
    render :layout => 'juan_femmes'
    end
 end
#GET /quartiers/agenda
def sitio
		@equipo=Equipo.find(params[:id])
		if !@equipo.jeunes.nil?
  
  		  @jeunes=@equipo.jeunes
  		else

  		 @femmes=@equipo.femmes
  		end
	    redirect_to equipe_presentacion_path(:id=>@equipo)
	
end

def presentacion
  	@equipo=Equipo.find(params[:id]) 
    @sitio=@equipo.sitio
  	@presentacion=@sitio.presentacion
   
	if !@equipo.jeunes.nil?
	   @jeunes=@equipo.jeunes
	else
	  @femmes=@equipo.femmes
	end
	@pagina=@presentacion.paginas.first

	if !@presentacion.paginas.nil? && !@pagina.nil? 	   
  	 redirect_to equipe_pagina_path(:id=>@pagina)
  	end
end
	
	
def pagina
 		@pagina=Pagina.find(params[:id])

    	
    	if !@pagina.presentacion.nil?
    	  @presentacion=@pagina.presentacion
    	  @sitio=@presentacion.sitio
    	  @paginas=@presentacion.paginas
                  @seccion_menu=:presentacion

    	elsif !@pagina.red.nil?
    	  @red=@pagina.red
    	  @sitio=@red.sitio
    	   @paginas=@red.paginas
                  @seccion_menu=:actividades

    	end
    	  if !@pagina.pagina_id.nil?
    	     @original=Pagina.where(:id=>@pagina.pagina_id).first
	         @red=@original.red
	    	 @paginas=@red.paginas
	    	 @sitio=@red.sitio
	      
	         #@paginas.where(:id=>@pagina.pagina_id).first
		  end
		else
    	
    	
    	@equipo=@sitio.equipo   	
    	 if !@equipo.jeunes.nil?
    	 @jeunes=@equipo.jeunes
    	else
    	  @femmes=@equipo.femmes
   end
         segun_proyecto      

     logger.info "///////////////////////EN EQUIPO concreto:"+@equipo.nombre+" ******************************"
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
                  segun_proyecto      

end

def actividades
	@equipo=Equipo.find(params[:id]) 
    @sitio=@equipo.sitio
  	@red=@sitio.red
   
	if !@equipo.jeunes.nil?
	   @jeunes=@equipo.jeunes
	else
	  @femmes=@equipo.femmes
	end
	@pagina=@red.paginas.first

	if !@red.paginas.nil? && !@pagina.nil? 	   
  	 redirect_to equipe_pagina_path(:id=>@pagina)
  	end


end
#def agenda
#      @equipo=@Equipo.find(params[:id])
#      if !@equipo.jeunes.nil?
#        @jeunes=@equipo.jeunes
#        @equipos=@jeunes.equipos
#      else
#       @femmes=@equipo.femmes
#       @equipos=@femmes.equipos
#      end
#      @sitio=@equipo.sitio
#end

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
            segun_proyecto      

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
                segun_proyecto      

end
    
end
