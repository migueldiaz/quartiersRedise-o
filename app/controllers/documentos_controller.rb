class DocumentosController < ApplicationController
layout 'mono'
#########
#Sustituir lo que proceda por documento
# GET /paginas/1.xml
 before_filter :require_login
 def index
   require_traductor
 
  if params[:modo]=='sintrad'
	   @documentos = Documento.find(:all, :conditions => "docEs = '' || archivo = '' || docFr=''|| archivofr = '' " )
	  
  elsif  params[:modo]=='sinrevisar'	
   	 	@documentos = Documento.find(:all, :conditions =>  "revisado = false || revisadofr=false")
  else
 	 @documentos = Documento.all
  end
end

 def new
  if params[:tipo]=='foro'
   @foro=Foro.find(params[:id])
   @documento=@foro.documentos.new  
  else
  	@pagina = Pagina.find(params[:id])
  	@documento = @pagina.documentos.new
  end
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @documento }
    end
end


def create
   
    @documento = Documento.create(params[:documento])
    
    #@pagina=@documento.pagina
    
     respond_to do |format|
     	 if @documento.save
       	 format.html { redirect_to(@documento, :notice =>  t('exito')) }
        	format.xml  { render :xml => @documento, :status => :created, :location => @documento }
     	 else
      	  format.html { render :action => "new" }
       	 format.xml  { render :xml => @documento.errors, :status => :unprocessable_entity }
     	 end
    end
    
end
def show
   @documento = Documento.find(params[:id])
   @pagina = @documento.pagina
   
end
 def destroy
    @documento = Documento.find(params[:id])
    if !@documento.pagina.nil?
    	@pagina=@documento.pagina
    	@documento.destroy
    	redirect_to pagina_path(@pagina)
    else
       @foro=@documento.foro
       @documento.destroy
       redirect_to foro_path(@foro)
    end
end
def edit
   @documento = Documento.find(params[:id])
   @pagina = Pagina.find(@documento.pagina)
end 

def update
   @documento = Documento.find(params[:id])
 #  @pagina = Pagina.find(@documento.pagina)

    respond_to do |format|
      if @documento.update_attributes(params[:documento])
        format.html { redirect_to(@documento, :notice => 'Parrafo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @documento.errors, :status => :unprocessable_entity }
      end
    end
end
 
################
end
