class UsuarioforosController < ApplicationController
layout 'juan_jeunes'

  def segun_proyecto
    if @usuarioforo.jeunes.nil?
    render :layout => 'juan_femmes'
    end
 end

def new
	if params[:tipo]=='jeunes'
		@jeunes=Jeunes.first
		@usuarioforo=@jeunes.usuarioforos.new
    else
       @femmes=Femmes.first
       @usuarioforo=@femmes.usuarioforos.new


end
segun_proyecto
end
def show
@usuarioforo=Usuarioforo.find(params[:id])
	if !@usuarioforo.jeunes.nil?
		@jeunes=@usuarioforo.jeunes
        @foros=@jeunes.sitio.foros
    else
       @femmes=@usuarioforo.femmes
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



##################3
end
