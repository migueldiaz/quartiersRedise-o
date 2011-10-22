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
   	   if current_user.traduceA=='es'   
			@paginas = Pagina.find(:all, :conditions => "revisado = 'false'")
	   else
	    	@paginas = Pagina.find(:all, :conditions => "revisadofr = 'false'")
	   end 	 	
  else
 	 @paginas = Pagina.all
  end
    
   respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @paginas }
      format.json
    end
  end

  # GET /paginas/1
  # GET /paginas/1.xml
  def show
    @pagina = Pagina.find(params[:id])
        logger.info "show paginas"+@pagina.to_s
        

  if !@pagina.presentacion.nil?
  @sitio=@pagina.presentacion.sitio
  elsif !@pagina.red.nil?
  @sitio=@pagina.red.sitio
  elsif !@pagina.pagina.nil?
  @sitio=@pagina.pagina.red.sitio
  elsif  !@pagina.enfoque.nil?
   @sitio=@pagina.enfoque.sitio
  elsif  !@pagina.vision.nil?
   @sitio=@pagina.vision.sitio
  elsif  !@pagina.protagonistas.nil?
   @sitio=@pagina.protagonistas.sitio
  else
   @sitio=@pagina.documentacion.sitio
#  logger.info "por aqui!!"+@pagina.documentacion.nil?.to_s
end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pagina }
       format.json  { render :json => @pagina }
    end
  end

  # GET /paginas/new
  # GET /paginas/new.xml
  def new
    
    if params[:tipo].to_s=='red'  
      @sitio=Sitio.find(params[:id])
      @red=@sitio.red
      @pagina = @red.paginas.new
    elsif params[:tipo].to_s=='presentacion' 
        @sitio=Sitio.find(params[:id]) 
    	@presentacion=@sitio.presentacion
   		@pagina = @presentacion.paginas.new
    elsif params[:tipo].to_s=='documentacion' 
       @sitio=Sitio.find(params[:id])
       @documentacion=@sitio.documentacion
       @pagina=@documentacion.paginas.new
     elsif params[:tipo].to_s=='vision' 
       @sitio=Sitio.find(params[:id])
       @vision=@sitio.vision
       @pagina=@vision.pagina.create
    elsif params[:tipo].to_s=='enfoque' 
       @sitio=Sitio.find(params[:id])
       @enfoque=@sitio.enfoque
       @pagina=@enfoque.paginas.new
    elsif params[:tipo].to_s=='protagonistas' 
       @sitio=Sitio.find(params[:id])
       @protagonistas=@sitio.protagonistas
       @pagina=@protagonistas.paginas.new
    else
     @pagina=Pagina.find(params[:id])
     @pagina=@pagina.paginas.new
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
    logger.info "**********Pagina creada"
    @pagina = Pagina.create(params[:pagina])
    #if !@pagina.presentacion.nil?
     # @presentation=@pagina.presentacion
    #else
     # @red=@pagina.red
    #end
    
   
    respond_to do |format|
      if @pagina.save

        format.html { redirect_to(@pagina, :notice => t('exito')) }
        format.xml  { render :xml => @pagina, :status => :created, :location => @pagina }


  		  format.js   
  		   else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pagina.errors, :status => :unprocessable_entity }
	    format.js  
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
    elsif !@pagina.red.nil?
       @red=@pagina.red
       @pagina.destroy
       redirect_to red_path(@red.sitio) 
     elsif !@pagina.documentacion.nil?
       @documentacion=@pagina.documentacion
       @pagina.destroy
       redirect_to documentacion_path(@documentacion.sitio) 
     elsif !@pagina.enfoque.nil?
       @enfoque=@pagina.enfoque
       @pagina.destroy
       redirect_to enfoque_path(@enfoque.sitio) 
     elsif !@pagina.protagonistas.nil?
       @protagonistas=@pagina.protagonistas
       @pagina.destroy
       redirect_to enfoque_path(@protagonistas.sitio)   
     else
       destino=@pagina.pagina_id
       @pagina.destroy
       redirect_to pagina_path(:id=>destino)
     end
   # respond_to do |format|
  #    format.html {  redirect_to secion_path(@seccion) }
  #    format.xml  { head :ok }
  #  end
  end
end
