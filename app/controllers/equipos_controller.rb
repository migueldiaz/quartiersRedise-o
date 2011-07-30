class EquiposController < ApplicationController
 layout 'mono' 
 def index
 
 
  if params[:modo]=='sintrad'
  	   if current_user.traduceA=='es'   
			 @equipos = Equipo.find(:all, :conditions => "descripcionEs=''")
	   else
	    	 @equipos = Equipo.find(:all, :conditions => "descripcionFr=''")	
	   end
  
  elsif  params[:modo]=='sinrevisar'	
   		 @equipos = Equipo.find(:all, :conditions => "revisado = 'false'")	
  else
 	  @equipos = Equipo.all
  end
 end

 
 
 def new
    @web=Web.find(params[:id])
   @equipo = @web.equipos.create(params[:equipo])
 end
  def create 
   
    @web=Web.find(params[:id])
    @equipo = @web.equipos.create(params[:equipo])
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
   if @equipo.sitio.nil?
     @equipo.sitio=Sitio.new
    end   
    
 end
  def destroy 
    @equipo = Equipo.find(params[:id])
    @equipo.destroy
    redirect_to admin_path
  end
end
