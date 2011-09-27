class ForosController < ApplicationController
  # GET /foros
  # GET /foros.xml
  layout 'mono'
  def index
    	
    if params[:modo]=='sintrad'
  	   if current_user.traduceA=='es'   
			 @foros = Foro.find(:all, :conditions => "tituloes=''")
	   else
	    	 @foros = Foro.find(:all, :conditions => "titulofr=''")	
	   end
  elsif  params[:modo]=='sinrevisar'	
   		if current_user.traduceA=='es'   
			 @foros = Foro.find(:all, :conditions => "revisado = 'false'")	
	   	else
	    	  @foros = Foro.find(:all, :conditions => "revisadofr = 'false'")	
	   	end	
  elsif params[:modo]=='todos'
   @foros=Foro.all
  
  else
    	@sitio=Sitio.find(params[:id])
    	@foros=@sitio.foros
    		if !@sitio.jeunes.nil?
     	 		@jeunes=@sitio.jeunes
     	 		if @jeunes.clave.nil?
        			 @jeunes.clave=Clave.new
     	 		end
     	 		@clave=@jeunes.clave
    		else
    	 		@femmes=@sitio.femmes
    	  		if @femmes.clave.nil?
         			@femmes.clave=Clave.new
      			end
       			@clave=@femmes.clave
    		end
    end 
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @foros }
      format.json {render :json => @foros.to_json(:include => { 
                                                :comentarios => {:only => :tituloes , :include => { :comentarios => {:only => :tituloes } },:only => :tituloes } 
                                                              }
                                                )
                  }
    end
  end

  # GET /foros/1
  # GET /foros/1.xml
  def show
   @foro=Foro.find(params[:id])
   @comentarios=@foro.comentarios
  
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @foro }
    format.json {render :json => @foro.comentarios.sort_by( &:created_at ).reverse.to_json(:include => {
                                        :comentarios => {:only => :tituloes, :include=>{:usuarioforo=>{:only=>[:equipo_id]}}}} ,:only => [:tituloes, :created_at],:include=>{:usuarioforo=>{:only=>[ :equipo_id]}}
                                        )
          }

    end
  end

  # GET /foros/new
  # GET /foros/new.xml
  def new
    @sitio=Sitio.find(params[:id])
    @foro = @sitio.foros.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @foro }
    end
  end

  # GET /foros/1/edit
  def edit
    @foro = Foro.find(params[:id])
  end

  # POST /foros
  # POST /foros.xml
  def create
    @foro = Foro.new(params[:foro])
	
    respond_to do |format|
      if @foro.save
        format.html { redirect_to(@foro, :notice => t('exito')) }
        format.xml  { render :xml => @foro, :status => :created, :location => @foro }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @foro.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /foros/1
  # PUT /foros/1.xml
  def update
    @foro = Foro.find(params[:id])

    respond_to do |format|
      if @foro.update_attributes(params[:foro])
        format.html { redirect_to(@foro, :notice => t('modificado')) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @foro.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /foros/1
  # DELETE /foros/1.xml
  def destroy
    @foro = Foro.find(params[:id])
    @sitio=@foro.sitio
    @foro.destroy

    respond_to do |format|
      format.html { redirect_to(foros_url(:id=>@sitio)) }
      format.xml  { head :ok }
    end
  end
end
