class RedsController < ApplicationController
 layout 'mono' 
before_filter :require_login
 def index
     @sitio=Sitio.find(params[:id])
    if @sitio.red==nil
      @sitio.red=Red.new
    end
     @red=  @sitio.red
     if @red.seccion.nil?
      @red.seccion=Seccion.new
     end
     redirect_to red_path(@red)
 
  end

  def new
  @sitio = Sitio.find(params[:id])
  @red = @sitio.red.create(params[:sitio_id])
  # @seccion=@red.Seccion.create(params[:red_id])  
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @red }
    end
end

  def show
   @sitio = Sitio.find(params[:id])
    if @sitio.red.nil?
 	  @sitio.red=Red.create
 	end
  	@red=@sitio.red
   
  end

  def create
    @sitio = sitio.find(params[:sitio_id])
    @red = @sitio.red.create(params[:sitio_id])
    redirect_to sitio_path(@sitio)
  end
end

