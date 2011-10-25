class ProtagonistasController < ApplicationController
	 layout 'mono' 
     before_filter :require_login
     def index
       show
     end
     
	def show
		@sitio=Sitio.find(params[:id])
		if @sitio.protagonistas.nil?
			@sitio.protagonistas=Protagonistas.create
	    end
	    #Ahora es copiar presentacion o actividades e introducirlo en paginas
		@protagonistas=@sitio.protagonistas
		@paginas=@protagonistas.paginas

	end

end
