class AsociationController < ApplicationController
 	layout 'juan'
 	
  
  def p5
     render :layout=>'last_p5'
  end
  
 	def videos
		@asociacion=Asociacion.first
 		@sitio=@asociacion.sitio
# 		@paginas=@sitio.paginas
 		if params[:search]
 		  @resultado = Video.with_query(params[:search])
 		  @videos=@resultado.paginate(:page=> params[:page],:per_page => 100)
 		else
 		  @videos=Video.find(:all)
 		end
 		
 	end
 	
 	
 	
 	def biblioteca
 		@asociacion=Asociacion.first
 		@sitio=@asociacion.sitio
     session[:sitio_id]=@sitio.id

# 		@paginas=@sitio.paginas
# 		@documentosasoc=Documento.where(:pagina_id=>@paginas)
 		if params[:search]
 		  @resultado = Documento.where("foro_id is null and pagina_id is not null").with_query(params[:search])
 		  @documentos=@resultado.paginate(:page=> params[:page],:per_page => 100)
 		else
 			@documentos=Documento.where("foro_id is null and pagina_id is not null")
 		end
 		
 	end
 	
 	
 	
 	def vision
 		@asociacion=Asociacion.first
 		@sitio=@asociacion.sitio
 		@vision=@sitio.vision
 		redirect_to asociation_pagina_path(:id=>@vision.pagina)
 	end
 	def enfoque
  		@asociacion=Asociacion.first
  		@enfoque=@asociacion.sitio.enfoque
  		@pagina=@enfoque.paginas.first
 		if !@pagina.nil?
  		redirect_to asociation_pagina_path(:id=>@pagina)
		end
 		
 	end
 	def protagonistas
 		@asociacion=Asociacion.first
  		@protagonistas=@asociacion.sitio.protagonistas
  		@pagina=@protagonistas.paginas.first
 		if !@pagina.nil?
  		redirect_to asociation_pagina_path(:id=>@pagina)
		end
 		
 	end
	
#GET /quartiers/agenda
	def vision
	@asociacion=Asociacion.first
	@sitio=@asociacion.sitio
	@vision=@sitio.vision
	@pagina=@vision.pagina
	redirect_to asociation_pagina_path(:id=>@pagina)
	
	end
	
	
	
	def sitio
  	@asociacion=Asociacion.first
		if @asociacion.sitio.nil?
		@asociacion.sitio=Sitio.create
		end
	@sitio=@asociacion.sitio
	redirect_to sitio_path(:id=>@sitio)
end
	
	
	
	def agenda
  		@asociacion=Asociacion.first
  		@sitio=@asociacion.sitio
	end
	def proyectos
  		@asociacion=Asociacion.first
  		@red=@asociacion.sitio.red
  		@pagina=@red.paginas.first
 		if !@pagina.nil?
  		redirect_to asociation_pagina_path(:id=>@pagina)
		end
	end
	
	def presentacion
  
  		@asociacion=Asociacion.first
  		@presentacion=@asociacion.sitio.presentacion
  		@pagina=@presentacion.paginas.first
       if !@pagina.nil?
  		redirect_to asociation_pagina_path(:id=>@pagina)
	   end
	end
	def pagina #Contemplar aqui los nuevos casos
		@pagina=Pagina.find(params[:id])
		
		if !@pagina.presentacion.nil?
	  		@sitio=@pagina.presentacion.sitio
	  		@presentacion=@sitio.presentacion
		    @paginas=@presentacion.paginas
        @seccion_menu=:Presentacion
		elsif !@pagina.red.nil?
	  		@sitio=@pagina.red.sitio
	  		@red=@sitio.red
	  		@paginas=@red.paginas
	  	elsif !@pagina.vision.nil?
	  	    @sitio=@pagina.vision.sitio
	  		@vision=@sitio.vision
	  		@pagina=@vision.pagina
	  	elsif !@pagina.enfoque.nil?
	  	    @sitio=@pagina.enfoque.sitio
	  		@enfoque=@sitio.enfoque
	  		@paginas=@enfoque.paginas
        @seccion_menu=:enfoque
	  	elsif !@pagina.protagonistas.nil?
	  	    @sitio=@pagina.protagonistas.sitio
	  		@protagonistas=@sitio.protagonistas
	  		@paginas=@protagonistas.paginas
        @seccion_menu=:protagonistas
		end
		@asociacion=Asociacion.first
	    
	end
	
	
	
	def asociacion
  		#@web=Web.first
  		#@asociation=@web.asociacion
  		
  		redirect_to asociation_presentacion_path(:id=>@seccion)
	end
	
	def colaborador
		@asociacion=Asociacion.first
  		@sitio=@asociacion.sitio
		@aportan=@sitio.colaboradors.where('aporta'=>true)
		@noaportan=@sitio.colaboradors.where('aporta'=>false)
    
  end
  
    def colaborador_aportan
    @asociacion=Asociacion.first
      @sitio=@asociacion.sitio
    @aportan=@sitio.colaboradors.where('aporta'=>true)
    
  end

    def colaborador_no_aportan
    @asociacion=Asociacion.first
      @sitio=@asociacion.sitio
    @noaportan=@sitio.colaboradors.where('aporta'=>false)
    
  end

  
  
    def agenda
    	@seccion_menu="agenda"
    	@asociacion=Asociacion.first
  		@sitio=@asociacion.sitio
       @eventos=@sitio.eventos.find(:all, :order => 'fecha DESC')  
    if(!params[:id].blank?)
       @evento_sel=Evento.find(params[:id])
  end
     end	
    def contacto
    	@asociacion=Asociacion.first
  		@sitio=@asociacion.sitio
     	@contacto=@sitio.contacto
        @email = Email.new
    end
   
   
end
