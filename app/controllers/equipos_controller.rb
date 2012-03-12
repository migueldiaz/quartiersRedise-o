class EquiposController < ApplicationController
 layout 'mono' 
 before_filter :require_login
 def index
 
  if params[:modo]=='sintrad'
  	 @equipos = Equipo.find(:all, :conditions => "descripcionEs='' || descripcionFr=''")	
  elsif  params[:modo]=='sinrevisar'	
   	 @equipos = Equipo.find(:all, :conditions => "revisado = 'false' || revisadofr = 'false'")	
  elsif params[:id]
 	  @sitio=Sitio.find(params[:id])
 	  if !@sitio.jeunes.nil?
 	   @jeunes=@sitio.jeunes
 	   @equipos = @jeunes.equipos
 	  else
 	   @femmes=@sitio.femmes
 	   @equipos = @femmes.equipos
 	 end
 elsif params[:tipo]=='jeunes'
 @jeunes=Jeunes.first
 @equipos=@jeunes.equipos
 elsif  params[:tipo]=='femmes'
 @femmes=Femmes.first
 @equipos=@femmes.equipos
 else 
 @equipos=Equipo.all
 end
 
 respond_to do |format|
 format.html # index.html.erb
 format.json {render :json => @equipos.to_json}
 end

end

 
 
 def new
    @sitio=Sitio.find(params[:id])
    if !@sitio.femmes.nil?
       @equipo=@sitio.femmes.equipos.new
    else
       @equipo=@sitio.jeunes.equipos.new
    end
 end
 
  def create 
 	 @equipo=Equipo.create(params[:equipo])
 	 @equipo.sitio=Sitio.create
 	 if !@equipo.jeunes.nil?
 	    @jeunes=@equipo.jeunes
 	 else
 	    @femmes=@equipo.femmes
 	 end
   
     respond_to do |format|
      if @equipo.save
        format.html { redirect_to(@equipo.sitio, :notice =>  t('exito')) }
        format.xml  { render :xml => @equipo.sitio, :status => :created, :location => @equipo.sitio }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @equipo.errors, :status => :unprocessable_entity }
      end
    end
 end
 
 
  def edit
    @equipo = Equipo.find(params[:id])
  end

  def update
    @equipo = Equipo.find(params[:id])

    respond_to do |format|
      if @equipo.update_attributes(params[:equipo])
        format.html { redirect_to(equipo_path(@equipo), :notice => t('cambio')) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @equipo.errors, :status => :unprocessable_entity }
      end
    end
  end
  def show 
   @equipo = Equipo.find(params[:id])
   @sitio=@equipo.sitio
   if !@equipo.jeunes.nil?
      @jeunes=@equipo.jeunes
   else
      @femmes=@equipo.femmes
   end
 end
  def destroy 
    @equipo = Equipo.find(params[:id])
   
    if !@equipo.jeunes.nil?
 	   @jeunes=@equipo.jeunes
 	   @sitio=@jeunes.sitio
 	 
 	  else
 	   @femmes=@equipo.femmes
 	   @sitio=@femmes.sitio
      end
   
      @equipo.destroy
 	  redirect_to equipos_path(:id=>@sitio)
   
  end
end
