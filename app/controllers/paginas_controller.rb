class PaginasController < ApplicationController
  layout 'mono'
  # GET /paginas
  # GET /paginas.xml
  before_filter :require_login
  def index
    
     if params[:modo]=='sintrad'
  	   if current_user.traduceA=='es'   
			 @paginas = Pagina.find(:all, :conditions => "tituloes=''")
	   else
	    	 @paginas = Pagina.find(:all, :conditions => "titulofr=''")	
	   end
  
  elsif  params[:modo]=='sinrevisar'	
   		 @paginas = Pagina.find(:all, :conditions => "revisado = 'false'")	
  else
 	 @paginas = Pagina.all
  end
    
   respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @paginas }
    end
  end

  # GET /paginas/1
  # GET /paginas/1.xml
  def show
    @pagina = Pagina.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pagina }
    end
  end

  # GET /paginas/new
  # GET /paginas/new.xml
  def new
    @sitio=Sitio.find(params[:id])
    if params[:tipo].to_s=='red'  
      @red=@sitio.red
      @pagina = @red.paginas.new
    elsif params[:tipo].to_s=='presentacion'  
    	@presentacion=@sitio.presentacion
   		@pagina = @presentacion.paginas.new
    end
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pagina }
    end
  end

  # GET /paginas/1/edit
  def edit
    @pagina = Pagina.find(params[:id])
  end

  # POST /paginas
  # POST /paginas.xml
  def create
    
    @pagina = Pagina.create(params[:pagina])
    if !@pagina.presentacion.nil?
      @presentation=@pagina.presentacion
    else
      @red=@pagina.red
    end
    
    respond_to do |format|
      if @pagina.save
        format.html { redirect_to(@pagina, :notice => t('exito')) }
        format.xml  { render :xml => @pagina, :status => :created, :location => @pagina }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pagina.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /paginas/1
  # PUT /paginas/1.xml
  def update
    @pagina = Pagina.find(params[:id])

    respond_to do |format|
      if @pagina.update_attributes(params[:pagina])
        format.html { redirect_to(@pagina, :notice => t('exito')) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pagina.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /paginas/1
  # DELETE /paginas/1.xml
  def destroy
    @pagina = Pagina.find(params[:id])
    if !@pagina.presentacion.nil?
     @presentacion=@pagina.presentacion
     @pagina.destroy
     redirect_to presentacion_path(@presentacion.sitio) 
    else
       @red=@pagina.red
       @pagina.destroy
       redirect_to red_path(@red.sitio) 
     end
   # respond_to do |format|
  #    format.html {  redirect_to secion_path(@seccion) }
  #    format.xml  { head :ok }
  #  end
  end
end
