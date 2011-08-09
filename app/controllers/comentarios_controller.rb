class ComentariosController < ApplicationController
  layout 'quartiers'
  
  def index
    @foro=Foro.find(params[:id])
    @comentarios=@foro.comentarios

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comentarios }
    end
  end

  # GET /comentarios/1
  # GET /comentarios/1.xml
  def show
    @comentario = Comentario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comentario }
    end
  end

  # GET /comentarios/new
  # GET /comentarios/new.xml
  def new
   if params[:tipo]=='respuesta'
		###Mucha atencion al orden
	    @original=Comentario.find(params[:id])
        @jeunes=@original.foro.sitio.jeunes
	    @comentario=@original.comentarios.new
	    @foro=@original.foro
    else
  	  @foro=Foro.find(params[:id])
  	  @comentario = @foro.comentarios.new
  	  @jeunes=@foro.sitio.jeunes
  	end
    @foros=@jeunes.sitio.foros
    @comentarios=@foro.comentarios
    
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comentario }
    end
  end

  # GET /comentarios/1/edit
  def edit
    @comentario = Comentario.find(params[:id])
  end

  # POST /comentarios
  # POST /comentarios.xml
  def create
    @comentario = Comentario.new(params[:comentario])
    respond_to do |format|
      if @comentario.save
        format.html { redirect_to(jeunes_foro_path(:id=>@comentario.foro), :notice => t('exito')) }
        format.xml  { render :xml => @comentario.foro, :status => :created, :location => @comentario.foro }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comentario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comentarios/1
  # PUT /comentarios/1.xml
  def update
    @comentario = Comentario.find(params[:id])

    respond_to do |format|
      if @comentario.update_attributes(params[:comentario])
        format.html { redirect_to(@comentario, :notice => t('exito')) }
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
    #@foro=@comentario.foro
    @comentario.destroy
    redirect_to foro_path(@foro)
    
  end
end
