class FondosController < ApplicationController
  # GET /foros
  # GET /foros.xml
  layout 'mono'
  
  def index
    @sitio=Sitio.find(params[:id])
    @fondos=@sitio.fondos
  end
  def new
    @sitio=Sitio.find(params[:id])
    @fondo=@sitio.fondos.new
    
  end
  
  def create
    
    @fondo = Fondo.create(params[:fondo])
    
    #@pagina=@documento.pagina
    
    respond_to do |format|
      if @fondo.save
        format.html { redirect_to(@fondo, :notice =>  t('exito')) }
        format.xml  { render :xml => @fondo, :status => :created, :location => @fondo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fondo.errors, :status => :unprocessable_entity }
      end
    end
    
  end
  def show
    @fondo = Fondo.find(params[:id])
    @sitio = @fondo.sitio
    
  end
  def destroy
    @fondo = Fondo.find(params[:id])
    @sitio=@fondo.sitio
    @fondo.destroy
    redirect_to fondos_path(:id=>@sitio)
    
  end
  def edit
    @fondo = Fondo.find(params[:id])
  end 
  
  def update
    @fondo = Fondo.find(params[:id])
    #  @pagina = Pagina.find(@documento.pagina)
    
    respond_to do |format|
      if @fondo.update_attributes(params[:fondo])
        format.html { redirect_to(@fondo, :notice => t('exitom')) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fondo.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  
end
