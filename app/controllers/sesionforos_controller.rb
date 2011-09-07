class SesionforosController < ApplicationController
  layout 'quartiers'
  
  def new
  
  end
  def create 
  usuarioforo=Usuarioforo.authenticate(params[:email],params[:password])
   if usuarioforo
       session[:usuarioforo_id]=usuarioforo.id
       I18n.locale=usuarioforo.idioma
       if !usuarioforo.jeunes.nil?
          redirect_to jeunes_foros_path
      
       elsif !usuarioforo.femmes.nil?
         redirect_to femmes_foros_path
       end
   else
    flash.now.alert = t('revisardatos')
    #render 'new'
    	if params[:tipo]=='jeunes'
      		redirect_to jeunes_acceso_path
    	else
   			redirect_to femmes_acceso_path
   		end 
   	end
  end
  def destroy
  session[:usuarioforo_id] = nil
  redirect_to jeunes_acceso_path, :notice => t('desconectado')
  end

end
