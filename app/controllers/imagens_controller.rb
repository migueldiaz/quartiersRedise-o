class ImagensController < ApplicationController
layout 'mono'
#########
#Sustituir lo que proceda por documento
# GET /paginas/1.xml
 before_filter :require_login
 def index
 
 
  if params[:modo]=='sintrad'
  	 @imagenes = Imagen.find(:all, :conditions => "piefoto='' || piefotofr='' ")	

  elsif  params[:modo]=='sinrevisar'	
   		@imagenes = Imagen.find(:all, :conditions => "revisado = 'false' || revisadofr = 'false'")	
  else
 	 @imagenes = Imagen.all
  end
end

 def new
 
  	@pagina = Pagina.find(params[:id])
  	@imagen = @pagina.imagens.new
  
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @imagen }
    end
end


def create
   
    @imagen = Imagen.create(params[:imagen])
    
    #@pagina=@documento.pagina
    
     respond_to do |format|
     	 if @imagen.save
       	 format.html { redirect_to(@imagen, :notice =>  t('exito')) }
        	format.xml  { render :xml => @imagen, :status => :created, :location => @imagen }
     	 else
      	  format.html { render :action => "new" }
       	 format.xml  { render :xml => @imagen.errors, :status => :unprocessable_entity }
     	 end
    end
    
end
def show
   @imagen = Imagen.find(params[:id])
   @pagina = @imagen.pagina
   
end
 def destroy
    @imagen = Imagen.find(params[:id])
     @pagina=@imagen.pagina
    @imagen.destroy
    	redirect_to pagina_path(@pagina)
   
end
def edit
   @imagen = Imagen.find(params[:id])
end 

def update
   @imagen = Imagen.find(params[:id])
 #  @pagina = Pagina.find(@documento.pagina)

    respond_to do |format|
      if @imagen.update_attributes(params[:imagen])
        format.html { redirect_to(@imagen, :notice => t('exitom')) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @imagen.errors, :status => :unprocessable_entity }
      end
    end
end
 
################
end
