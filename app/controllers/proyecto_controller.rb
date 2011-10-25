class ProyectoController < ApplicationController
  layout 'mono'
  before_filter :require_login
 def show
    @web=Web.all.first    
     if @web.proyecto.nil?
       @web.proyecto=Proyecto.create
     end
      @proyecto=@web.proyecto 
    if @proyecto.sitio.nil?
     @proyecto.sitio=Sitio.new
    end         
    redirect_to sitio_path(@proyecto.sitio)   
  end
end
def create
 puts 'Se creo el proyecto'
end
