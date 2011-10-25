class SeccionsController < ApplicationController
 layout 'mono' 
 # GET /seccions
  # GET /seccions.xml
 #Este metodo deberia desaparecer#############################
   def index
   if params[:modo]=='sintrad'
  	   if current_user.traduceA=='es'   
			 @secciones = Seccion.find(:all, :conditions => "tituloes=''")
	   else
	    	 @secciones = Seccion.find(:all, :conditions => "titulofr=''")	
	   end
  
  elsif  params[:modo]=='sinrevisar'	
   		 @secciones = Seccion.find(:all, :conditions => "revisado = 'false'")	
  else
 	 @secciones = Seccion.all
  end
  end
##############################################################
  # GET /seccions/1
  # GET /seccions/1.xml
  def show
   @seccion = Seccion.find(params[:id])
   if !@seccion.presentacion.nil?
    	@presentacion=@seccion.presentacion
    	@sitio=@presentacion.sitio
    else
    	@red=@seccion.red
    	@sitio=@red.sitio
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @seccion }
    end
  end

  # GET /seccions/new
  # GET /seccions/new.xml
  def new
      if params[:tipo]=='presentacion'
        @presentacion=Presentacion.find(params[:id]) 
        @seccion = @presentacion.seccions.create(params[:seccion])
      end
      if params[:tipo]=='red'
        @red=Red.find(params[:id]) 
       @seccion = @red.seccions.create(params[:seccion])
      end
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @seccion }
    end

  end

  # GET /seccions/1/edit
  def edit
    @seccion = Seccion.find(params[:id])
  end

  # POST /seccions
  # POST /seccions.xml
  def create
 
    #@pagina = Pagina.find(params[:pagina_id])
    #@parrafo = @pagina.parrafos.create(params[:parrafo])
    #redirect_to pagina_path(@pagina) 
    if params[:tipo]=='presentacion'
      @presentacion=Presentacion.find(params[:presentacion_id])
      if !@presentacion.nil?
        @seccion = @presentacion.seccions.create(params[:seccion])
        redirect_to presentacion_path(@presentacion)
       end
   end
    if params[:tipo]=='red'
      @red=Red.find(params[:red_id])
      if !@red.nil?
        @seccion = @red.seccions.create(params[:seccion])
        redirect_to red_path(@red)
       end
   end
   # respond_to do |format|
    #  if @seccion.save
     #   format.html { redirect_to(@seccion.presentacion, :notice => 'Seccion was successfully created.') }
      #  format.xml  { render :xml => @presentacion, :status => :created, :location => @presentacion }
     # else
      #  format.html { render :action => "new" }
       # format.xml  { render :xml => @seccion.errors, :status => :unprocessable_entity }
      #end
    #end
  end

  # PUT /seccions/1
  # PUT /seccions/1.xml
  def update
    @seccion = Seccion.find(params[:id])
    respond_to do |format|
      if @seccion.update_attributes(params[:seccion])
        format.html { redirect_to(@seccion, :notice => 'Seccion was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @seccion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /seccions/1
  # DELETE /seccions/1.xml
  def destroy
    @seccion = Seccion.find(params[:id])
    
     if !@seccion.presentacion.nil?
      @presentacion=Presentacion.find(@seccion.presentacion)
      @seccion.destroy
      redirect_to presentacion_path(@presentacion)      
    end   
    if !@seccion.red.nil?
      @red=Red.find(@seccion.red)
      @seccion.destroy
      redirect_to red_path(@red)      
    end   
   

   # respond_to do |format|
    #  format.html { redirect_to(seccions_url) }
    #  format.xml  { head :ok }
   # end
  end
end
