class FemmesController < ApplicationController
	 layout 'mono'
 	def index
     	 @web=Web.all.first    
    	 if @web.femmes.nil?
    	   @web.femmes=Femmes.create
    	 end
    	@femmes=@web.femmes 
    
    	if @femmes.sitio.nil?
    	 @femmes.sitio=Sitio.new
   		 end      
       
   		 redirect_to sitio_path(@femmes.sitio)   


 end
end
