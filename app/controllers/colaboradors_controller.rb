class ColaboradorsController < ApplicationController
  layout 'mono'
  # GET /colaboradors
  # GET /colaboradors.xml
  before_filter :require_login
  def index
  	if params[:modo]=='sintrad' &&
  	   	if current_user.traduceA=='es'   
			@colaboradors = Colaborador.find(:all, :conditions => "nombreEs = '' or infoEs= '' ")
	   	else
	   		@colaboradors = Colaborador.find(:all, :conditions => "nombreFr = '' or infoFr= '' ")	
	   	end
 	elsif  params[:modo]=='todos'
 	     @colaboradors = Colaborador.all	
 	elsif  params[:modo]=='sinrevisar'
   	   if current_user.traduceA=='es'   
   		 @colaboradors = Colaborador.find(:all, :conditions => "revisado=false")	
   	   else
   	     @colaboradors = Colaborador.find(:all, :conditions => "revisado=false")
   	   end
   	else
   		@sitio = Sitio.find(params[:id]) 
 		@colaboradors = @sitio.colaboradors
 	 end
 
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
  @colaborador = @sitio.colaboradors.new

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
   @colaborador = Colaborador.create(params[:colaborador]) 
   @sitio=@colaborador.sitio
   
    respond_to do |format|
      if @colaborador.save
        format.html { redirect_to(@colaborador, :notice =>  t('exito')) }
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
        format.html { redirect_to(@colaborador, :notice =>  t('exitom')) }
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
