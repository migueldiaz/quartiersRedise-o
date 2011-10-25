class TraficoController < ApplicationController
  def dirige
 	 if !current_user.nil?	
 			if is_traductor
      			 redirect_to traductor_url,:notice=>t('welcome')+' '+current_user.nombre
   			elsif is_admin 
         		redirect_to admin_path,:notice=>t('welcome')+' '+current_user.nombre
     	 	else
       	 		redirect_to sitio_path(current_user.sitio), :notice => t('welcome')+' '+current_user.nombre
     	 	end
     else
      	redirect_to login_path
	 end
	
  end
end
