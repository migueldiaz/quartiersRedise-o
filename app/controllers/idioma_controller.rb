class IdiomaController < ApplicationController
	def setspanish
		I18n.locale='es'	
 	    redirect_to params[:url]
 	   
	end
	def setfrench
 		I18n.locale='fr'	
 	    redirect_to params[:url]
	end
end
