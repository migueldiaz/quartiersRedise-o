class PresentacionsController < ApplicationController
 layout 'mono' 

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
  @presentacion = @sitio.presentacion.create(params[:sitio_id])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @presentacion }
    end
end

  def show
   @sitio = Sitio.find(params[:id])
    if @sitio.presentacion.nil?
      @sitio.presentacion=Presentacion.new
    end
     @presentacion=  @sitio.presentacion
     if @presentacion.seccion.nil?
      @presentacion.seccion=Seccion.new
     end
  
   @seccion=@presentacion.seccion
   
  end

  def create
    @sitio = sitio.find(params[:sitio_id])
    @presentacion = @sitio.presentacion.create(params[:sitio_id])
    redirect_to sitio_path(@sitio)
  end
end
