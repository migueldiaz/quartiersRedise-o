class TraficoController < ApplicationController
  def dirige
 	 if !current_user.nil?	
 			if is_traductor
      			 redirect_to traductor_url
   			elsif is_admin 
         		redirect_to admin_path,:notice=>t('welcome')
     	 	else
       	 		redirect_to sitio_path(current_user.sitio), :notice => t('welcome')
     	 	end
     else
      	redirect_to root_path
	 end
	
  end
end
