class AsociacionController < ApplicationController
 before_filter :require_login
 layout 'mono'
 def show
    @web=Web.find(params[:id])
    @asociacion=@web.asociacion 
     if @asociacion.nil?
    @asocacion=@web.asociacion.create
    end
    if @asociacion.sitio.nil?
     @asociacion.sitio=Sitio.new
    end    
    redirect_to sitio_path(@asociacion.sitio)    
  end
end
