class PaginasController < ApplicationController
  layout 'mono'
  # GET /paginas
  # GET /paginas.xml
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
    @seccion=Seccion.find(params[:id])
    @pagina = @seccion.paginas.create(params[:pagina])
    
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
    @seccion=Seccion.find(params[:id])
    @pagina = @seccion.paginas.create(params[:pagina])

    respond_to do |format|
      if @pagina.save
        format.html { redirect_to(@pagina, :notice => 'Pagina was successfully created.') }
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
        format.html { redirect_to(@pagina, :notice => 'Pagina was successfully updated.') }
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
    @seccion = Seccion.find(params[:seccion_id])
    @pagina = @seccion.paginas.find(params[:id])
    @pagina.destroy
    redirect_to seccion_path(@seccion) 
  
   # respond_to do |format|
  #    format.html {  redirect_to secion_path(@seccion) }
  #    format.xml  { head :ok }
  #  end
  end
end
