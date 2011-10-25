class EnfoqueController < ApplicationController
	 layout 'mono' 
     before_filter :require_login
     
	def show
		@sitio=Sitio.find(params[:id])
		if @sitio.enfoque.nil?
			@sitio.enfoque=Enfoque.create
	    end
	    #Ahora es copiar presentacion o actividades e introducirlo en paginas
		@enfoque=@sitio.enfoque
		@paginas=@enfoque.paginas

	end

end
