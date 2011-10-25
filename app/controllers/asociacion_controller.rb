class AsociacionController < ApplicationController
 layout 'mono'
 def show
    @web=Web.find(params[:id])
    @asociacion=@web.asociacion 
    if @asociacion.nil?
    @web.asociacion =Asociacion.new
  end
    if @asociacion.sitio.nil?
     @asociacion.sitio=Sitio.new
    end    
    redirect_to sitio_path(@asociacion.sitio)    
  end
  

end
