class PresentacionsController < ApplicationController
 layout 'mono' 

 def index
    @sitio=Sitio.find(params[:id])
    if @sitio.presentacion==nil
      @sitio.presentacion=Presentacion.new
    end
     @presentacion=  @sitio.presentacion
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
   @presentacion = Presentacion.find(params[:id])
   @sitio = Sitio.find(@presentacion.sitio)
   @secciones=@presentacion.seccions.where('red_id'=> @red)
   
  end

  def create
    @sitio = sitio.find(params[:sitio_id])
    @presentacion = @sitio.presentacion.create(params[:sitio_id])
    redirect_to sitio_path(@sitio)
  end
end
