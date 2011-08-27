class ComentariosController < ApplicationController
  layout :another_by_method
  before_filter :require_usuarioforo
  
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
    @foro=@comentario.foro
    @sitio=@foro.sitio
    @foros=@sitio.foros
    if !@sitio.femmes.nil?
      @femmes=@sitio.femmes
    else
      @jeunes=@sitio.jeunes
    end
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
   @sitio=@foro.sitio
   @foros=@sitio.foros
   if !@sitio.jeunes.nil?
   		@jeunes=@sitio.jeunes
   elsif !@sitio.femmes.nil?
      @femmes=@sitio.femmes
   end
   #id=params[:respuesta]
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
    @comentario = Comentario.create(params[:comentario])
    @foro=@comentario.foro
    @sitio=@foro.sitio
     respond_to do |format| 
      if @comentario.save && !@sitio.jeunes.nil?
      	 format.html { redirect_to(jeunes_foro_path(:id=>@foro), :notice => t('exito')) }
      elsif  @comentario.save && !@sitio.femmes.nil?
      	format.html { redirect_to(femmes_foro_path(:id=>@foro), :notice => t('exito')) }
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
