class PresentacionsController < ApplicationController
 layout 'mono' 
before_filter :require_login
 def index
    @sitio=Sitio.find(params[:id])
    if @sitio.presentacion.nil?
      @sitio.presentacion=Presentacion.new
    end
     @presentacion=  @sitio.presentacion
     if @presentacion.seccion.nil?
      @presentacion.seccion=Seccion.new
     end
     redirect_to presentacion_path(@presentacion)
  end

  def new
  @sitio = Sitio.find(params[:id]) 
   @presentacion = @sitio.presentacion.create(params[:id]=>@sitio)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @presentacion }
    end
end

  def show
  logger.info "shhhhhhhhhhhhhhhhhhhhhh"
 	@sitio = Sitio.find(params[:id])
 	if @sitio.presentacion.nil?
 	  @sitio.presentacion=Presentacion.create
 	end
  	@presentacion=@sitio.presentacion
	
     respond_to do |format|
     logger.info("inentando encontrar el tmeplaea")
      format.html # index.html.erb
      format.json {render :json => @presentacion.paginas.to_json}
      
    end
  end

  def create
    @sitio = sitio.find(params[:sitio_id])
    @presentacion = @sitio.presentacion.create(params[:sitio_id])
    #redirect_to presentacion_path(@presentacion)
  end
end
