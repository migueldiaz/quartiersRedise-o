class TraficoController < ApplicationController
  def dirige
 	 if !current_user.nil?	
 			if is_traductor
      			 redirect_to traductor_url
   			elsif is_admin 
         		redirect_to admin_path,:notice=>'Bienvenido administrador'
     	 	else
       	 		redirect_to sitio_path(usuario.sitio), :notice => 'Bienvenido' 
     	 	end
     else
      	redirect_to root_path
	 end
	
  end
end
