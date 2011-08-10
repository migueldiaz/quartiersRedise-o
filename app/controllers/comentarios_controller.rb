class ComentariosController < ApplicationController
  layout :another_by_method
  def another_by_method
    if !params[:vista]
      "quartiers"
    else
      "mono"
    end
  end

  
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
  
   @foro=Foro.find(params[:id])
   @comentario = @foro.comentarios.new
   @jeunes=@foro.sitio.jeunes
   @foros=@jeunes.sitio.foros
   id=params[:respuesta]
    
    
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
    @foro=@comentario.foro
    respond_to do |format|
      if @comentario.save
        format.html { redirect_to(jeunes_foro_path(:id=>@foro), :notice => t('exito')) }
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
        format.html { redirect_to(comentario_path(@comentario,:vista=>'gestion'), :notice => t('exito')) }
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
    @foro=@comentario.foro
    @comentario.destroy
    redirect_to comentarios_path(:id=>@foro,:vista=>'gestion')
    
  end
end
