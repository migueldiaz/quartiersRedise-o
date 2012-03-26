class JeunesController < ApplicationController
 	layout 'juan_jeunes'
 	require 'will_paginate/array'
def esjeunes(pagina)

 return true
end

def videos
 		@jeunes=Jeunes.first
 		@sitio=@jeunes.sitio	
 		@paginas=@sitio.paginas
 		@videosjeunes=Video.where(:pagina_id=>@paginas)
 		if params[:search]
 		  @resultado = @videosjeunes.with_query(params[:search])
 		  @videos=@resultado.paginate(:page=> params[:page],:per_page => 10)
 		else
 			@videos=@videosjeunes.paginate(:page => params[:page], :per_page => 10)
 	end
     # @seccion_menu=:biblioteca   
end



def biblioteca
 		@jeunes=Jeunes.first
 		@sitio=@jeunes.sitio	
 		@paginas=@sitio.paginas
 		@documentosjeunes=Documento.where(:pagina_id=>@paginas)
 		if params[:search]
 		  @resultado = @documentosjeunes.with_query(params[:search])
 		  @documentos=@resultado.paginate(:page=> params[:page],:per_page => 10)
 		else
 			@documentos=@documentosjeunes.paginate(:page => params[:page], :per_page => 10)
 	end
      @seccion_menu=:biblioteca
end
 	
 	
#GET /quartiers/agenda
def sitio
  	@jeunes=Jeunes.first
		if @jeunes.sitio.nil?
		@jeunes.sitio=Sitio.create
		end
	@sitio=@jeunes.sitio
	redirect_to sitio_path(:id=>@sitio)
end
def acceso
  session[:tipo_foro]="jeunes"
  @seccion_menu=:foros

	@jeunes=Jeunes.first	
end
def foros
   session[:tipo_foro]="jeunes"
   if !usuarioforologado
      redirect_to jeunes_acceso_path
    elsif usuarioforologado.jeunes.nil?
      redirect_to femmes_foros_path
    end
    
	@jeunes=Jeunes.first
	@foros=@jeunes.sitio.foros.reverse
    @seccion_menu=:foros

end
def foro
     if !usuarioforologado
      redirect_to jeunes_acceso_path
     elsif usuarioforologado.jeunes.nil?
      redirect_to femmes_foros_path
    end
	@foro=Foro.find(params[:id])
	@jeunes=@foro.sitio.jeunes
	@foros=@jeunes.sitio.foros.reverse
  
   ##########Visualizacion correos unicos
   #@usuarios=@foro.comentarios.collect(&:usuarioforo).uniq
   #@correos=@usuarios.collect(&:email).uniq
   
   ##########  
  
  
  @seccion_menu=:foros
end
	
def agenda
  		@jeunes=Jeunes.first
  		@sitio=@jeunes.sitio
end
	
def proyectos
  		@jeunes=Jeunes.first
  		@red=@jeunes.sitio.red
 
  		@pagina=@red.paginas.first
	   if !@pagina.nil?
  		redirect_to jeunes_pagina_path(:id=>@pagina)
  	   end
end
	
def presentacion
  	@jeunes=Jeunes.first
  	@presentacion=@jeunes.sitio.presentacion
  	@pagina=@presentacion.paginas.first
	if !@presentacion.paginas.nil? && !@pagina.nil?
  		redirect_to jeunes_pagina_path(:id=>@pagina)
  	end
end
def documentacion
  	@jeunes=Jeunes.first
  	@documentacion=@jeunes.sitio.documentacion
  	@pagina=@documentacion.paginas.first

	if !@documentacion.paginas.nil? && !@pagina.nil?
  		redirect_to jeunes_pagina_path(:id=>@pagina)
  	end
end

def pagina
		@pagina=Pagina.find(params[:id])
		@jeunes=Jeunes.first
		@sitio=@jeunes.sitio
		if !@pagina.presentacion.nil?
	  		@presentacion=@sitio.presentacion
		    @paginas=@presentacion.paginas
        @seccion_menu=:presentacion

		elsif !@pagina.red.nil?
	  		@red=@sitio.red
	  		@paginas=@red.paginas
        @seccion_menu=:actividades

		else 
    logger.info "+++++++++++++++++++++++++++++++++++++++++++++++++++++++cargando documentacion de jeunes c"  
	  		@documentacion=@sitio.documentacion
	  		@paginas=@documentacion.paginas
                @seccion_menu=:documentacion

		end
		if !@pagina.pagina_id.nil?
    logger.info "++++++++++++++////////////////////////"  
	     @original=@paginas.where(:id=>@pagina.pagina_id).first
		end
		
	    
end

def colaborador
		@jeunes=Jeunes.first
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
         @email = Email.new
end

def equipos
   #logger.info "///////////////////////EN EQUIPOs: ******************************"

    	@web=Web.first
  		@jeunes=@web.jeunes
  		@equipos=@jeunes.equipos
  		@sitio=@jeunes.sitio
        respond_to do |format|
            format.xml {render :xml => @equipos.sort_by( &:id).to_xml(:only => [:id, :nombre])}
            format.html
    end
end



def equipo

  @equipo=Equipo.find(params[:id])
  @jeunes=@equipo.jeunes
  @equipos=jeunes.equipos
  @sitio=@equipo.sitio
  redirect_to equipe_sitio_path(:id=>@sitio)  
end

def buscador
        @web=Web.first
      @jeunes=@web.jeunes
      @sitio=@jeunes.sitio

end
def forito
   
  foro
 render :layout=>'foro_interactivo'
end

end
