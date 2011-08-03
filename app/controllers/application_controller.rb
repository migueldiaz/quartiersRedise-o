class ApplicationController < ActionController::Base
  
  protect_from_forgery
  before_filter :require_login,:except=>:quartiers
  before_filter :set_locale
  helper_method :current_user,:setspanish
  helper_method :valida_usuario,:is_admin,:is_traductor,:require_login
  
  def is_admin
	if current_user.tipo.to_s=='admin'
	  return true;
	else
		return false;
	end
end
  

 
 
 
  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
     #redirect_to root_path # halts request cycle
    end
  end

   def logged_in?
    !!current_user
  end
  private
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
