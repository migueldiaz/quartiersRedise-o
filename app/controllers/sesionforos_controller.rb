class SesionforosController < ApplicationController
  layout 'juan_jeunes'
  
  def segun_proyecto
    if @usuarioforo.jeunes.nil?
    render :layout => 'juan_femmes'
    end
 end

  
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
    @usuarioforo=Usuarioforo.find(session[:usuarioforo_id])
    path=jeunes_acceso_path
     if @usuarioforo.jeunes.nil?
       path=femmes_acceso_path
    end
  session[:usuarioforo_id] = nil
  redirect_to path, :notice => t('desconectado')
  end

end
