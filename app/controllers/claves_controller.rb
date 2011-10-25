class ClavesController < ApplicationController
 	layout 'mono'

	def new
 	 @clave=Clave.new
	end
	############################
	def create
     @jeunes=Jeunes.first
   	 @femmes=Femmes.first
 
 		if params[:tipo]=='jeunes'
 		
 			if params[:clave]==@jeunes.clave.clave
   				redirect_to registroforo_path(:tipo=>'jeunes')
 			else
  				redirect_to jeunes_acceso_path
  			end
  		else
			@femmes=Femmes.first
 			if params[:clave]==@femmes.clave.clave
   				redirect_to registroforo_path(:tipo=>'femmes')
 			else
  			redirect_to femmes_acceso_path
  			end	
		end
	end#######

	def acceso
		@sitio=Sitio.find(params[:id])
		if !@sitio.femmes.nil?
			 @femmes=Femmes.first
		else 
			 @jeunes=Jeunes.first
		end
	end##########
	
	def valida
		if params[:tipo]=='jeunes'
		  @jeunes=Jeunes.first
		elsif params[:tipo]=='femmes'
			@femmes=Femmes.first
		end
		if !@jeunes.nil? && params[:clave]==@jeunes.clave.clave
	 	 redirect_to new_usuario_foro_path(@id=>@jeunes.sitio)
		elsif !@femmes.nil? && params[:clave]==@femmes.clave.clave
		  redirect_to new_usuario_foro_path(@id=>@femmes.sitio)
		end############
	end
	def edit
		 @clave=Clave.find(params[:id])
	end

	def update
  	  @clave = Clave.find(params[:id])
   	  @clave.update_attributes(params[:clave])
   
  		if !@clave.jeunes.nil?
  		   redirect_to(foros_path(:id=>@clave.jeunes.sitio), :notice => t('exitom')) 
   		else
     	 	redirect_to(foros_path(:id=>@clave.femmes.sitio), :notice => t('exitom')) 
    	end
	end 
end
