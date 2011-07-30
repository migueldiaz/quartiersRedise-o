class UsuariosController < ApplicationController
  layout 'mono'
  # GET /usuarios
  # GET /usuarios.xml
 
   
  def index
    if params[:tipo]=='traductor'
       @usuarios=Usuario.where('tipo'=>'traductor')
    else
      @sitio=Sitio.find(params[:id])
      @usuarios = @sitio.usuarios.all
      
   end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @usuarios }
    end
  end

  # GET /usuarios/1
  # GET /usuarios/1.xml
  def show
    @usuario = Usuario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @usuario }
    end
  end

  # GET /usuarios/new
  # GET /usuarios/new.xml
 def new
  if params[:tipo]=='traductor'
  @usuario = Usuario.create(params[:usuario])
  else
   @sitio = Sitio.find(params[:id]) 
   @usuario = @sitio.usuarios.create(params[:usuario])
  end 
   
   # @sitio = Sitio.find(params[:id]) 
   # @evento=Evento.new
   
  end



  # GET /usuarios/1/edit
  def edit
    @usuario = Usuario.find(params[:id])
  end

  # POST /usuarios
  # POST /usuarios.xml
  ################################3

def create
  @sitio = Sitio.find(params[:id]) 
  
  @usuario = @sitio.usuarios.create(params[:usuario])
   

    #@evento = Evento.new(params[:evento])
    respond_to do |format|
      if @usuario.save
        format.html { redirect_to(@usuario, :notice => t('exito')  ) }
        format.xml  { render :xml => @usuario, :status => :created, :location => @usuario }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @usuario.errors, :status => :unprocessable_entity }
      end
    end
  end
  
 
  # PUT /usuarios/1
  # PUT /usuarios/1.xml
  def update
    @usuario = Usuario.find(params[:id])
    #@sitio=@usuario.sitio
    respond_to do |format|
      if @usuario.update_attributes(params[:usuario])
        format.html { redirect_to(@usuario, :notice => 'Usuario was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @usuario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.xml
  def destroy
    @usuario = Usuario.find(params[:id])
    
     if @usuario.tipo=='traductor'
      @usuario.destroy
      redirect_to usuarios_path(:tipo=>'traductor')
    else
     @sitio=@usuario.sitio
     @usuario.destroy
      redirect_to usuarios_path(:id=>@sitio)  
    end 
   
    
   
  end
end
