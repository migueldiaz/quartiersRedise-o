class FemmesController < ApplicationController
  layout 'juan_femmes'

def videos
 		@femmes=Femmes.first
 		@sitio=@femmes.sitio
 		@paginas=@sitio.paginas
 		@videosfemmes=Video.where(:pagina_id=>@paginas)
 		if params[:search]
 		  @resultado = @videosfemmes.with_query(params[:search])
 		  @videos=@resultado.paginate(:page=> params[:page],:per_page => 10)
 		else
 			@videos=@videosfemmes.paginate(:page => params[:page], :per_page => 10)
 		end
 		        @seccion_menu=:videos

end

def biblioteca
 		@femmes=Femmes.first
 		@sitio=@femmes.sitio
          session[:sitio_id]=@sitio.id

 		@paginas=@sitio.paginas
 		@documentosfemmes=Documento.where(:pagina_id=>@paginas)
    logger.info @documentosfemmes.length
    logger.info "ofuuuu"
 		if params[:search]
 		  @resultado = @documentosfemmes.with_query(params[:search])
 		  @documentos=@resultado.paginate(:page=> params[:page],:per_page => 100)
 		else
 			@documentos=@documentosfemmes.paginate(:page => params[:page], :per_page => 100)
 		end
 		        @seccion_menu=:biblioteca

end

 	
#GET /quartiers/agenda
def sitio
	@femmes=Femmes.first
		if @femmes.sitio.nil?
		@femmes.sitio=Sitio.create
		end
	@sitio=@femmes.sitio
	redirect_to sitio_path(:id=>@sitio)
end
	
	
def agenda
  		@femmes=Femmes.first
  		@sitio=@femmes.sitio
end
	
def proyectos
  		@femmes=Femmes.first
  		@red=@femmes.sitio.red
 
  		@pagina=@red.paginas.first
	   if !@pagina.nil?
  		redirect_to femmes_pagina_path(:id=>@pagina)
  	   end
end
	
def presentacion
  	@femmes=Femmes.first
  	@presentacion=@femmes.sitio.presentacion
  	@pagina=@presentacion.paginas.first
	if !@presentacion.paginas.nil? && !@pagina.nil?
  		redirect_to femmes_pagina_path(:id=>@pagina, :p5js=>true)
  	end
end
def documentacion
  	@femmes=Femmes.first
  	@documentacion=@femmes.sitio.documentacion
  	@pagina=@documentacion.paginas.first
	if !@documentacion.paginas.nil? && !@pagina.nil?
  		redirect_to femmes_pagina_path(:id=>@pagina)
  	end
end

def pagina
      @p5js=params[:p5js]

		@pagina=Pagina.find(params[:id])
		@femmes=Femmes.first
		@sitio=@femmes.sitio
		if !@pagina.presentacion.nil?
	  		@presentacion=@sitio.presentacion
		    @paginas=@presentacion.paginas
        @seccion_menu=:presentacion
		elsif !@pagina.red.nil?
	  		@red=@sitio.red
	  		@paginas=@red.paginas
                @seccion_menu=:actividades

		else 
	  		@documentacion=@sitio.documentacion
	  		@paginas=@documentacion.paginas
        @seccion_menu=:documentacion
		end
		if !@pagina.pagina_id.nil?
	     @original=@paginas.where(:id=>@pagina.pagina_id).first
		end
		
	    
end

def colaborador
		@femmes=Femmes.first
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
def colaborador
		@femmes=Femmes.first
  		@sitio=@femmes.sitio
		@aportan=@sitio.colaboradors.where('aporta'=>true)
		@noaportan=@sitio.colaboradors.where('aporta'=>false)
    
end
def agenda
    	
    	@femmes=Femmes.first
  		@sitio=@femmes.sitio
       @eventos=@sitio.eventos.find(:all, :order => 'fecha DESC')  
     	
end	
def contacto
    	@femmes=Femmes.first
  		@sitio=@femmes.sitio
     	@contacto=@sitio.contacto
         @email = Email.new
 end
def equipos
    	@femmes=Femmes.first
  		@equipos=@femmes.equipos
  		@sitio=@femmes.sitio
        respond_to do |format|
            format.xml {render :xml => @equipos.sort_by( &:id).to_xml(:only => [:id, :nombre, :x, :y])}
            format.html
    end
end
def equipo
       @equipo=Equipo.find(params[:id])
      
       @femmes=@equipo.femmes
       @equipos=femmes.equipos
       
       @sitio=@equipo.sitio
       if !@sitio.presentacion.nil?
         @seccion=@sitio.presentacion.seccion
         @pagina=@seccion.paginas.first  
         if !@seccion.nil?
          redirect_to femmes_pagina_path(:id=>@pagina) 
     
         end
       end
end
def acceso
  session[:tipo_foro]="femmes"

  @seccion_menu=:foros

	@femmes=Femmes.first
	
end

def foros
  session[:tipo_foro]="femmes"
    if !usuarioforologado
      redirect_to femmes_acceso_path
    elsif usuarioforologado.femmes.nil?
      redirect_to femmes_acceso_path
    end
	@femmes=Femmes.first
	@foros=@femmes.sitio.foros.reverse
    @seccion_menu=:foros
       logger.info("---------------------------------------------------------------")
       logger.info(I18n.locale)

end
def foro
     if !usuarioforologado
      redirect_to femmes_acceso_path
     elsif usuarioforologado.femmes.nil?
      redirect_to femmes_acceso_path
    end
	@foro=Foro.find(params[:id])
	@femmes=@foro.sitio.femmes
	@foros=@femmes.sitio.foros.reverse
            @seccion_menu=:foros
       logger.info("---------------------------------------------------------------")
       logger.info(I18n.locale)
end
def forito
   
  foro
 render :layout=>'foro_interactivo'
end

end
