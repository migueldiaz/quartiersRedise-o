class RedsController < ApplicationController
 layout 'mono' 

 def index
    @sitio=Sitio.find(params[:id])
    if @sitio.red==nil
      @sitio.red=Red.new
    end
     @red=  @sitio.red
     redirect_to red_path(@red)
  end

  def new
  @sitio = Sitio.find(params[:id])
  @red = @sitio.red.create(params[:sitio_id])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @red }
    end
end

  def show
   @red = Red.find(params[:id])
   @sitio = Sitio.find(@red.sitio)
   @secciones=@red.seccions.where('red_id'=> @red)
   
  end

  def create
    @sitio = sitio.find(params[:sitio_id])
    @presentacion = @sitio.presentacion.create(params[:sitio_id])
    redirect_to sitio_path(@sitio)
  end
end

