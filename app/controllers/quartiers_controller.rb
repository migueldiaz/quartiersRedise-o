class QuartiersController < ApplicationController
  	layout 'juan'
 	def index 
  	#@eventos = Evento.where('sitio_id'=> @sitio)
  		@web=Web.first
  		#@sitio=@web.asociacion.sitio
          respond_to do |format|
      format.html  {render :layout => 'index'}  
    end

 	end
#GET /quartiers/agenda
  def prueba
    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
    def load
      logger.info "load ----------------"+params[:id]
        @comentario=Comentario.find(params[:id])
        @foro=@comentario.foro
    respond_to do |format|
        format.js   {render :layout => false}  
    end
  end


	def agenda
  		@web=Web.first
  		@asociacion=@web.asociacion.sitio
  		@proyecto=@web.proyecto.sitio
	end
	def asociacion
  		@web=Web.first
  		@asociacion=@web.asociacion
  		@sitio=@web.asociacion.sitio
  		@seccion=@sitio.presentacion.seccions.first

  		redirect_to quartiers_seccion_path(:id=>@seccion)
	end
	def proyecto
  		@web=Web.first
  		@proyecto=@web.proyecto
  		@sitio=@web.proyecto.sitio
  		@seccion=@sitio.presentacion.seccions.first
  		redirect_to quartiers_seccion_path(:id=>@seccion)
	end
	
	def seccion
 		@seccion=Seccion.find(params[:id])
 		@paginas=@seccion.paginas
    	
    	if !@seccion.presentacion.nil?
    	  @sitio=@seccion.presentacion.sitio
    	else
    	  @sitio=@seccion.red.sitio
    	end
    	
    	if !@sitio.asociacion.nil?
    	  @asociacion=@sitio
    	elsif !@sitio.proyecto.nil?
    	  @proyecto=@sitio
    	else
    	   @web=Web.first
    	   @equipo=@sitio.equipo
    	   @equipos=@web.equipos
    	end
    	#@asociacion=Web.first.asociacion.sitio
	end
	def colaborador
		@sitio=Sitio.find(params[:id])
		@aportan=@sitio.colaboradors.where('aporta'=>true)
		@noaportan=@sitio.colaboradors.where('aporta'=>false)
    
        @web=Web.first
    	@equipos=@web.equipos
     	if !@sitio.equipo.nil?
     	  @equipo=@sitio.equipo
     	end
    
    end
    def agenda
    	
    	@sitio=Sitio.find(params[:id])
     	@eventos=@sitio.eventos
     	
     	
     	@web=Web.first
    	@equipos=@web.equipos
     	if !@sitio.equipo.nil?
     	  @equipo=@sitio.equipo
     	end
    end
    def contacto
    @sitio=Sitio.find(params[:id])
    @contacto=@sitio.contacto
    
    @web=Web.first
    @equipos=@web.equipos
     if !@sitio.equipo.nil?
     	 @equipo=@sitio.equipo
     end
    
    
    end
    def equipos
    	@web=Web.first
    	@equipos=@web.equipos
    	#@sitio=@equipos.first.sitio ###Solo para garantizar las validaciones
    end
    def equipo
       @equipo=Equipo.find(params[:id])
       @web=Web.first
       @equipos=@web.equipos
       
       @sitio=@equipo.sitio
       if !@sitio.presentacion.nil?
         @seccion=@sitio.presentacion .seccions.first  
         if !@seccion.nil?
          redirect_to quartiers_seccion_path(:id=>@seccion) 
     
         end
       end
    end
end
