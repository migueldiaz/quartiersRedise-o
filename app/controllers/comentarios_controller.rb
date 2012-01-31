class ComentariosController < ApplicationController
  #layout :another_by_method
  layout :segun_proyecto
  before_filter :autentifica
  
#  def another_by_method
#    if !params[:vista]
#      "juan_jeunes"
#    else
#      "juan_jeunes"
#    end
#  end
 def nuevoscomentarios(identificador)
    
     return @comentarios
  
  end
def nuevos

	     @comentario=Comentario.find(params[:id])
		 Integer identificador=Integer(params[:id]) 	
      	 @foro=@comentario.foro
      	
     	 @comentarios=@foro.comentarios.where(["id > ? and foro_id=?",identificador, @foro.id])
	
 	respond_to do |format|
     	 format.xml {render :xml =>  @comentarios.sort_by( &:created_at ).reverse.to_xml(:only => [:id, :tituloes,:textoes, :created_at,  :comentario_id],:include=>{:usuarioforo=>{:only=>[:id, :nombre, :email, :equipo_id]}})}
    end

end


def autentifica
  if(session[:usuario_id]==nil)
  require_usuarioforo
  end
end

  def segun_proyecto
    
    if params[:vista]
     'mono'
    else
      if !params[:tipo] && !params[:responde] && params[:id]
         @comentario=Comentario.find(params[:id])
      end
      
      if params[:tipo] && !@comentario.foro.sitio.jeunes.nil? 
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
		  	@comentarios = Comentario.find(:all, :conditions => "textoes = '' && tituloes = '' ")
	   	else
	      	@comentarios = Comentario.find(:all, :conditions => "textofr = '' && titulofr = ''")
	   	end
     elsif params[:modo]=='todos'
     @comentarios=Comentario.find(:all, :order => "created_at  DESC limit 20")
    
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
   @sitio.fondos
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
    params[:comentario][:created_at_admin]=Time.now.to_s
    @comentario = Comentario.create(params[:comentario])
    #@comentario.created_at=Time.now
    @foro=@comentario.foro
    @sitio=@foro.sitio
    ###OJO AQUI VALIDACION Y NOTIFICACION
     respond_to do |format| 
      if @comentario.save && !@sitio.jeunes.nil?
         	@traductores=Usuario.where(:tipo=>'traductor')	
         	@traductores.each do |traductor|
         	 AvisoMailer.traductor(traductor).deliver
         	end
      	 format.html { redirect_to(jeunes_foro_path(:id=>@foro), :notice => t('exito')) }
         format.js
      elsif  @comentario.save && !@sitio.femmes.nil?
      	format.html { redirect_to(femmes_foro_path(:id=>@foro), :notice => t('exito')) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comentario.errors, :status => :unprocessable_entity }
      end
   
    #AvisoMailer.aviso_foro(@comentario).deliver
    
   end
  end

  # PUT /comentarios/1
  # PUT /comentarios/1.xml
  def update
    @comentario = Comentario.find(params[:id])

    ############Aqui enviamos los correos
    if @comentario.revisado==true && @comentario.revisadofr==true
     	@foro=@comentario.foro
     	@usuarios=@foro.comentarios.collect(&:usuarioforo).uniq
     	@usuarios.each do |usuario|
    		AvisoMailer.aviso_foro(usuario,@comentario).deliver
     	end
    end
    #############
   
   
   
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
