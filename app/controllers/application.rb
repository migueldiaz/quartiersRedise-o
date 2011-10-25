class ApplicationController < ActionController::Base
  
  protect_from_forgery
  before_filter :set_locale
  
  helper_method :is_admin,:is_traductor,:current_user,:require_login,:usuarioforologado
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
