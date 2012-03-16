class UsuarioforosController < ApplicationController

layout 'mono'

before_filter :ubicacion,:require_login,:except=>:show

def ubicacion
puts '#########################' 
   
 	if params[:foro] 
 	     @foro=Foro.where('id=?',params[:foro])
 		 if !@foro.jeunes.nil?
    		  'juan_jeunes'
 		 elsif !@forero.femmes.nil?
   			'juan_femmes'
  		 end
  	else
    	 'mono'
    	
  	end 

end


def segun_proyecto
   if @usuarioforo.jeunes.nil?
   render :layout => 'mono'
   end
 end

def index
  session[:tipo_foro]=params[:tipo]
	if params[:tipo]=='jeunes'
		@jeunes=Jeunes.first
		@sitio=@jeunes.sitio
		@usuarios=@jeunes.usuarioforos
    else
       @femmes=Femmes.first
       @sitio=@femmes.sitio
       @usuarios=@femmes.usuarioforos
   end
   respond_to do |format|
      format.html # index.html.erb
      format.json {render :json => @usuarios.to_json}
      end
end

def new
	if session[:tipo_foro]=='jeunes'
		@jeunes=Jeunes.first
		 @sitio=@jeunes.sitio
		@usuarioforo=@jeunes.usuarioforos.new
    else
       @femmes=Femmes.first
        @sitio=@femmes.sitio
       @usuarioforo=@femmes.usuarioforos.new 
    end
end
def show
@usuarioforo=Usuarioforo.find(params[:id])
	if !@usuarioforo.jeunes.nil?
		@jeunes=Jeunes.first
		 @sitio=@jeunes.sitio
        @foros=@jeunes.sitio.foros
    else
         @femmes=Femmes.first
		 @sitio=@femmes.sitio
        @foros=@femmes.sitio.foros
    end
    segun_proyecto

end
 def edit
  @usuarioforo=Usuarioforo.find(params[:id])
  segun_proyecto

  end
def create
  
  @usuarioforo = Usuarioforo.create(params[:usuarioforo])
  
    #@evento = Evento.new(params[:evento])
    respond_to do |format|
      if @usuarioforo.save
        format.html { redirect_to(@usuarioforo, :notice => t('exito')  ) }
        format.xml  { render :xml => @usuarioforo, :status => :created, :location => @usuarioforo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @usuarioforo.errors, :status => :unprocessable_entity }
      end
    end
  end

   def update
    @usuarioforo = Usuarioforo.find(params[:id])
    #@sitio=@usuario.sitio
    respond_to do |format|
      if @usuarioforo.update_attributes(params[:usuarioforo])
        format.html { redirect_to(@usuarioforo, :notice => t('exitom')) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @usuarioforo.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @usuarioforo = Usuarioforo.find(params[:id])
    
    if @usuarioforo.jeunes.nil?
      @tipo='femmes'
    else 
     @tipo='jeunes'
    end
     @usuarioforo.destroy
      redirect_to usuarioforos_path(:tipo=>@tipo)  
   
  end



end
