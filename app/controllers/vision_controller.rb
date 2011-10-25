class VisionController < ApplicationController
 layout 'mono' 
 before_filter :require_login
def show
  @sitio=Sitio.find(params[:id])
  if @sitio.vision.nil?
    @sitio.vision=Vision.create
  end
  @vision=@sitio.vision
   if @vision.pagina.nil?
      puts 'No hay pagina para vision'
      @pagina=Pagina.create
      @pagina.vision=@vision
      @pagina.tituloes='Vision'
      @pagina.save
      #@pagina=@vision.pagina.new
      
    #redirect_to(new_pagina_path(:id=>@sitio,:tipo=>'vision'))
  end
  
  @pagina=@vision.pagina
  redirect_to(pagina_path(:id=>@pagina))
 
  
end

end
