class ParrafosController < ApplicationController
layout 'mono'
before_filter :require_login
def index 
	if params[:modo]=='sintrad'
		@parrafos = Parrafo.find(:all, :conditions => "textoes='' || textofr=''")
  	elsif  params[:modo]=='sinrevisar'
		@parrafos = Parrafo.find(:all, :conditions => "revisado = 'false' || revisadofr = 'false'")	
  	else
 	 	@parrafos = Parrafo.all
  	end
end


def new
  @pagina = Pagina.find(params[:id])
  @parrafo = @pagina.parrafos.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @parrafo }
    end
end


def create
    @parrafo = Parrafo.create(params[:parrafo])
    @pagina=@parrafo.pagina
    
    respond_to do |format|
      if @parrafo.save
        format.html { redirect_to(@parrafo, :notice =>  t('exito')) }
        format.xml  { render :xml => @parrafo, :status => :created, :location => @parrafo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @parrafo.errors, :status => :unprocessable_entity }
      end
    end



end
  def show
   @parrafo = Parrafo.find(params[:id])
   @pagina = Pagina.find(@parrafo.pagina)
  
  end
 def destroy
    @pagina = Pagina.find(params[:pagina_id])
    @parrafo = @pagina.parrafos.find(params[:id])
    @parrafo.destroy
    redirect_to pagina_path(@pagina)
  end
 def edit
   @parrafo = Parrafo.find(params[:id])
   @pagina = Pagina.find(@parrafo.pagina)
 end 

 def update
   @parrafo = Parrafo.find(params[:id])

    respond_to do |format|
      if @parrafo.update_attributes(params[:parrafo])
        format.html { redirect_to(@parrafo, :notice => 'Parrafo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @parrafo.errors, :status => :unprocessable_entity }
      end
    end
  end
 
 
end

