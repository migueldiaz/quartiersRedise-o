class DocumentosController < ApplicationController
layout 'mono'
#########
#Sustituir lo que proceda por documento
# GET /paginas/1.xml
 def index
 
 
  if params[:modo]=='sintrad'
  	   if current_user.traduceA=='es'   
			 @documentos = Documento.find(:all, :conditions => "doces=''")
	   else
	    	 @documentos = Documento.find(:all, :conditions => "docfr=''")	
	   end
  
  elsif  params[:modo]=='sinrevisar'	
   		 @documentos = Documento.find(:all, :conditions => "revisado = 'false'")	
  else
 	  @documentos = Documento.all
  end
 end

 def new
  @pagina = Pagina.find(params[:id])
  @documento = @pagina.documentos.create(params[:parrafo])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @documento }
    end
end


def create
    @pagina = Pagina.find(params[:pagina_id])
    @documento = @pagina.documentos.create(params[:parrafo])
    redirect_to pagina_path(@pagina)
  end
def show
   @documento = Documento.find(params[:id])
   @pagina = Pagina.find(@documento.pagina)
   
end
 def destroy
    @pagina = Pagina.find(params[:pagina_id])
    @documento = @pagina.documentos.find(params[:id])
    @documento.destroy
    redirect_to pagina_path(@pagina)
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
