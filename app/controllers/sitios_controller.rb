class SitiosController < ApplicationController
layout 'mono'
  # GET /sitios
  # GET /sitios.xml
  def index
    @sitios = Sitio.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sitios }
    end
  end


  # GET /sitios/1
  # GET /sitios/1.xml
  def show
   
    @sitio = Sitio.find(params[:id])
    
    if !@sitio.equipo.nil?
       @equipo=@sitio.equipo
       if !@equipo.jeunes.nil?
         @jeunes=@equipo.jeunes
       else
         @femmes=@equipo.femmes
       end
    end
    
    
    
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @sitio }
    end
  end

  # GET /sitios/new
  # GET /sitios/new.xml
  def new
    @sitio = Sitio.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sitio }
    end
  end

  # GET /sitios/1/edit
  def edit
    @sitio = Sitio.find(params[:id])
  end

  # POST /sitios
  # POST /sitios.xml
  def create
    @sitio = Sitio.new(params[:sitio])
    
    respond_to do |format|
      if @sitio.save
        format.html { redirect_to(@sitio, :notice => 'Sitio was successfully created.') }
        format.xml  { render :xml => @sitio, :status => :created, :location => @sitio }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sitio.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sitios/1
  # PUT /sitios/1.xml
  def update
    @sitio = Sitio.find(params[:id])

    respond_to do |format|
      if @sitio.update_attributes(params[:sitio])
        format.html { redirect_to(@sitio, :notice => 'Sitio was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sitio.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sitios/1
  # DELETE /sitios/1.xml
  def destroy
    @sitio = Sitio.find(params[:id])
    @sitio.destroy

    respond_to do |format|
      format.html { redirect_to(sitios_url) }
      format.xml  { head :ok }
    end
  end

  # GET /sitios/1
  # GET /sitios/1.xml
  def opciones
    @sitio = Sitio.find(params[:id])
    respond_to do |format|
      format.html # opciones.html.erb
      format.xml  { render :xml => @sitio }
    end
  end




end
