class ContactosController < ApplicationController
 layout 'mono' 

 def index
   ###########################
   if params[:modo]=='sintrad'
  	   if current_user.traduceA=='es'   
			 @contacts = Contacto.find(:all, :conditions => "infoEs=''")
	   else
	    	 @contactos = Contacto.find(:all, :conditions => "infoFr=''")	
	   end
   elsif  params[:modo]=='todos'
 	    @contactos = Contacto.all
 
  elsif  params[:modo]=='sinrevisar'	
   		 @contactos = Contacto.find(:all, :conditions => "revisado = 'false'")	
  else
   	@sitio=Sitio.find(params[:id])
      if @sitio.contacto.nil?
     		@sitio.contacto=Contacto.new
      end
     	@contacto=  @sitio.contacto
      redirect_to contacto_path(@contacto)
 	 end
 
 
 
  #################################
   
  end

  def new
  @sitio = Sitio.find(params[:id])
  @contacto = @sitio.contacto.create(params[:sitio_id])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @contacto }
    end
end

  def show
   @contacto = Contacto.find(params[:id])
   @sitio = @contacto.sitio
   
  end
   def edit
    @contacto = Contacto.find(params[:id])
  end

   # PUT /contactos/1
  # PUT /contactos/1.xml
  def update
    @contacto = Contacto.find(params[:id])

    respond_to do |format|
      if @contacto.update_attributes(params[:contacto])
        format.html { redirect_to(@contacto, :notice => 'Contacto was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @contacto.errors, :status => :unprocessable_entity }
      end
    end
  end


  def create
    @sitio = sitio.find(params[:sitio_id])
    @contacto = @sitio.contacto.create(params[:sitio_id])
    redirect_to sitio_path(@sitio)
  end
end


