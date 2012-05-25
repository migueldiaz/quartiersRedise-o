class ApplicationController < ActionController::Base
  
  protect_from_forgery
  before_filter :set_locale
  
  helper_method :is_admin,:is_traductor,:current_user,:require_login,:usuarioforologado,:validausuariositio
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
 
  private
 
  def record_not_found
    session[:usuario]=nil
     @url= request.url
     if !request.env['HTTP_REFERER'].nil?
     mensaje="Error al acceder a "+@url+" Se ha enviado el aviso correspondiente. Peticion realizada desde: #{request.env['HTTP_REFERER']}"
    AvisoMailer.error(mensaje).deliver
  else
     mensaje="Pongase en contacto con juanantonioruz@gmail.com para indicarle el error. Contact with juanantonioruz@gmail.com and communicate the details of this error"
    end 
     flash[:error] = mensaje
    redirect_to root_path
   
    #render :text => "404 No encontrado", :status => 404
  end
  def validausuariositio(sitio)
 	 if current_user.tipo!='admin' && current_user.tipo!='traductor' && current_user.sitio!=sitio
   	 	redirect_to trafico_url
  	 end
  end
  
  def usuarioforologado
   @usuarioforologado ||= Usuarioforo.find(session[:usuarioforo_id]) if session[:usuarioforo_id]
end
  
  def require_usuarioforo
    
     if usuarioforologado.nil?
      flash[:error] = t('loginrequerido')
      redirect_to jeunes_acceso_path # halts request cycle
	end
end

  
  
def require_admin
    if  current_user.nil? || current_user.tipo!='admin'
      flash[:error] = t('loginrequerido')
      redirect_to trafico_url # halts request cycle
	end
end


def require_traductor
     if  current_user.nil? || current_user.tipo!='traductor'
      flash[:error] = t('loginrequerido')
      redirect_to trafico_url # halts request cycle
	end
end

def require_login
     if current_user.nil?
        flash[:error] = t('loginrequerido')
        redirect_to trafico_url # halts request cycle
	end
end
  
def is_admin
	if current_user.tipo.to_s=='admin'
	  return true;
	else
		return false;
	end
end



   def logged_in?
    if !current_user==nil
         return true;
    else
       return false;
    end  
  end
 
 
  def current_user
   @current_user ||= Usuario.find(session[:usuario_id]) if session[:usuario_id]
  end
 
 def is_traductor
   		if current_user.tipo.to_s=='traductor'
    		return true
   		else
    		return false
   		end 
  	end
  	
   def set_locale
     if params.include?('locale')
       I18n.locale = params[:locale]
    end
     
  end
 
  def set_default_locale
   def @request.query_parameters
    {:locale => "fr"}.merge(@query_parameters)
    end
  end  

end
