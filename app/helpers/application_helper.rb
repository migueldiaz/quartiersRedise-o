module ApplicationHelper
def esfrances
     if( params[:locale]=='fr')
      return true
     else 
       return false 
     end
  end
def spanish
     if( params[:locale]=='es')
      return true
     else 
       return false 
     end
  end
def idioma
     return params[:locale]
    
  end

end
