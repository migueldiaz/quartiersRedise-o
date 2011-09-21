class ComentariosController < ApplicationController
  #layout :another_by_method
  layout :segun_proyecto
  before_filter :require_usuarioforo
  
#  def another_by_method
#    if !params[:vista]
#      "juan_jeunes"
#    else
#      "juan_jeunes"
#    end
#  end

  def segun_proyecto
    if params[:vista]
     'mono'
    else
      if !params[:tipo] && !params[:responde]
         @comentario=Comentario.find(params[:id])
      end
      
      if params[:tipo] ||!@comentario.foro.sitio.jeunes.nil? 
       
       'juan_jeunes'
      else
       'juan_femmes'
      end
    end
 end
  def index
    
    if params[:modo]=='sinrevisar'
    	if current_user.traduceA=='es'   
    		@comentarios=Comentario.find(:all, :conditions => "revisado = false")
    	else
    		@comentarios=Comentario.find(:all, :conditions => "revisadofr = false")
        end
    elsif params[:modo]=='sintrad'
    	if current_user.traduceA=='es'   
		  	@comentarios = Comentario.find(:all, :conditions => "textoes = '' || tituloes = '' ")
	   	else
	      	@comentarios = Comentario.find(:all, :conditions => "textofr = '' || titulofr = ''")
	   	end
    else
    	@foro=Foro.find(params[:id])
    	@comentarios=@foro.comentarios
    end
    segun_proyecto
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comentarios }
    end
  end
  
  

  # GET /comentarios/1
  # GET /comentarios/1.xml
  def show
    @comentario = Comentario.find(params[:id])
    @foro=@comentario.foro
    @sitio=@foro.sitio
    @foros=@sitio.foros
    if !@sitio.femmes.nil?
      @femmes=@sitio.femmes
    else
      @jeunes=@sitio.jeunes
    end
    segun_proyecto
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comentario }
      format.json {render :json => @comentario.to_json}

    end
  end

  # GET /comentarios/new
  # GET /comentarios/new.xml
  def new
  
   @foro=Foro.find(params[:id])
   @comentario = @foro.comentarios.new
   @sitio=@foro.sitio
   @foros=@sitio.foros
   if !@sitio.jeunes.nil?
   		@jeunes=@sitio.jeunes
   elsif !@sitio.femmes.nil?
      @femmes=@sitio.femmes
   end
   #id=params[:respuesta]
   segun_proyecto
   respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comentario }
      format.js
    end
  end

#  def response
#       respond_to do |format|
#         format.js
#      end
#  end

  # GET /comentarios/1/edit
  def edit
    @comentario = Comentario.find(params[:id])
    segun_proyecto
  end

  # POST /comentarios
  # POST /comentarios.xml
  def create
    @comentario = Comentario.create(params[:comentario])
    @foro=@comentario.foro
    @sitio=@foro.sitio
     respond_to do |format| 
      if @comentario.save && !@sitio.jeunes.nil?
      	 format.html { redirect_to(jeunes_foro_path(:id=>@foro), :notice => t('exito')) }
      elsif  @comentario.save && !@sitio.femmes.nil?
      	format.html { redirect_to(femmes_foro_path(:id=>@foro), :notice => t('exito')) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comentario.errors, :status => :unprocessable_entity }
      end
   end
  end

  # PUT /comentarios/1
  # PUT /comentarios/1.xml
  def update
    @comentario = Comentario.find(params[:id])

    respond_to do |format|
      if @comentario.update_attributes(params[:comentario])
       
        format.html { redirect_to(comentario_path(@comentario,:vista=>'gestion'), :notice => t('exito')) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comentario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comentarios/1
  # DELETE /comentarios/1.xml
  def destroy
    @comentario = Comentario.find(params[:id])
    @foro=@comentario.foro
    @comentario.destroy
    redirect_to comentarios_path(:id=>@foro,:vista=>'gestion')
    
  end
end
