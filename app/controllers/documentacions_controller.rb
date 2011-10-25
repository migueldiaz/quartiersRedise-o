class DocumentacionsController < ApplicationController
 layout 'mono' 
before_filter :require_login
 def index
    @sitio=Sitio.find(params[:id])
    if @sitio.documentacion.nil?
      @sitio.documentacion=documentacion.new
    end
     @documentacion=  @sitio.documentacion
     if @documentacion.seccion.nil?
      @documentacion.seccion=Seccion.new
     end
     redirect_to documentacion_path(@documentacion)
  end

  def new
  @sitio = Sitio.find(params[:id]) 
   @documentacion = @sitio.documentacion.create(params[:id]=>@sitio)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @documentacion }
    end
end

  def show
 	@sitio = Sitio.find(params[:id])
 	if @sitio.documentacion.nil?
 	  @sitio.documentacion=documentacion.create
 	end
  	@documentacion=@sitio.documentacion
  	
  
  end

  def create
    @sitio = sitio.find(params[:sitio_id])
    @documentacion = @sitio.documentacion.create(params[:sitio_id])
    #redirect_to documentacion_path(@documentacion)
  end
end
