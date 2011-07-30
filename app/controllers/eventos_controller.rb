class EventosController < ApplicationController
  layout 'mono'
  # GET /eventos
  # GET /eventos.xml
  def index

   if params[:modo]=='sintrad'
  	   if current_user.traduceA=='es'   
			 @eventos = Evento.find(:all, :conditions => "tituloEs = ''")
	   else
	    	 @eventos = Evento.find(:all, :conditions => "tituloFr = ''")	
	   end
 	elsif  params[:modo]=='todos'
 	     @eventos = Evento.all
 	    
 	
 	elsif  params[:modo]=='sinrevisar'
   	 @eventos = Evento.find(:all, :conditions => "revisado = 'false'")	
   	else
   	   @sitio = Sitio.find(params[:id]) 
       @eventos=@sitio.eventos.all
 	 end


  # @eventos = Evento.where('sitio_id'=> @sitio)
  
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @eventos }
    end
  end

  # GET /eventos/1
  # GET /eventos/1.xml
  def show
    @evento = Evento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @evento }
    end
  end

  # GET /eventos/new
  # GET /eventos/new.xml
  def new
    @sitio = Sitio.find(params[:id]) 
  @evento = @sitio.eventos.create(params[:evento])
   
   
   # @sitio = Sitio.find(params[:id]) 
   # @evento=Evento.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @evento }
    end
  end

  # GET /eventos/1/edit
  def edit
    @evento = Evento.find(params[:id])
  end

  # POST /eventos
  # POST /eventos.xml
  def create
  
  @sitio = Sitio.find(params[:id]) 
  @evento = @sitio.eventos.create(params[:evento])
   

    #@evento = Evento.new(params[:evento])
    respond_to do |format|
      if @evento.save
        format.html { redirect_to(@evento, :notice => t('exito')  ) }
        format.xml  { render :xml => @evento, :status => :created, :location => @evento }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @evento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /eventos/1
  # PUT /eventos/1.xml
  def update
    @evento = Evento.find(params[:id])

    respond_to do |format|
      if @evento.update_attributes(params[:evento])
        format.html { redirect_to(@evento, :notice => t('cambio')) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @evento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /eventos/1
  # DELETE /eventos/1.xml
  def destroy
    #@sitio = Sitio.find(params[:sitio_id])
    #@evento = @sitio.eventos.find(params[:id])
    #@evento.destroy
    #redirect_to eventos_path(@sitio)
   
    
    @evento = Evento.find(params[:id])
    @sitio=Sitio.find(@evento.sitio)
    @evento.destroy
    redirect_to eventos_path(:id=>@sitio)  


    #@evento = Evento.find(params[:id])
    #@sitio=Sitio.find(@evento.sitio_id)
    #@evento.destroy
    #redirect_to eventos_path(:id=>@sitio)
    #respond_to do |format|
    #  format.html { redirect_to(eventos_url(params[:id=>@sitio])) }
    #  format.xml  { head :ok }
    #end
  end
end
