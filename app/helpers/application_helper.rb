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

def comprueba valor
 if valor == I18n.locale.to_s
return "seleccionado"
else
return ""
end

end

end
