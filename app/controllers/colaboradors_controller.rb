class ColaboradorsController < ApplicationController
  layout 'mono'
  # GET /colaboradors
  # GET /colaboradors.xml
  def index


  	if params[:modo]=='sintrad'
  	   if current_user.traduceA=='es'   
			 @colaboradors = Colaborador.find(:all, :conditions => "nombreEs = '' or infoEs= '' ")
	   else
	    	 @colaboradors = Colaborador.find(:all, :conditions => "nombreFr = '' or infoFr= '' ")	
	   end
 	elsif  params[:modo]=='todos'
 	     @colaboradors = Colaborador.all
 	    
 	
 	elsif  params[:modo]=='sinrevisar'
   		
   		 @colaboradors = Colaborador.find(:all, :conditions => "revisado != true")	
   	else
   			@sitio = Sitio.find(params[:id]) 
 			@colaboradors = @sitio.colaboradors.all
 	 end
 
     #@aportadores= @colaboradors.find(:all, :conditions => "aporta = true")
     #Colaborador.find(:all, :conditions => "aporta = true")
  	 #@noaportadores= Colaborador.find(:all, :conditions => "aporta = false")

    respond_to do |format|
      format.html  # index.html.erb 
      format.xml  { render :xml => @colaboradors }
      format.json  { render :json => @colaboradors }
    end
  end

  # GET /colaboradors/1
  # GET /colaboradors/1.xml
  def show
    @colaborador = Colaborador.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @colaborador }
    end
  end

  # GET /colaboradors/new
  # GET /colaboradors/new.xml
  def new
  @sitio = Sitio.find(params[:id]) 
  @colaborador = @sitio.colaboradors.create(params[:colaborador]) 

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @colaborador }
    end
  end

  # GET /colaboradors/1/edit
  def edit
    @colaborador = Colaborador.find(params[:id])
  end

  # POST /colaboradors
  # POST /colaboradors.xml
  def create
   # @colaborador = Colaborador.new(params[:colaborador])
   @sitio = Sitio.find(params[:id]) 
   @colaborador = @sitio.colaboradors.create(params[:colaborador]) 

    respond_to do |format|
      if @colaborador.save
        format.html { redirect_to(@colaborador, :notice => 'Colaborador was successfully created.') }
        format.xml  { render :xml => @colaborador, :status => :created, :location => @colaborador }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @colaborador.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /colaboradors/1
  # PUT /colaboradors/1.xml
  def update
    @colaborador = Colaborador.find(params[:id])

    respond_to do |format|
      if @colaborador.update_attributes(params[:colaborador])
        format.html { redirect_to(@colaborador, :notice => 'Colaborador was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @colaborador.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /colaboradors/1
  # DELETE /colaboradors/1.xml
  def destroy
     
    @colaborador = Colaborador.find(params[:id])
    @sitio=Sitio.find(@colaborador.sitio)
    @colaborador.destroy
    redirect_to colaboradors_path(:id=>@sitio)  



   # respond_to do |format|
   #   format.html { redirect_to(colaboradors_url) }
   #   format.xml  { head :ok }
   #  end
  end
end
