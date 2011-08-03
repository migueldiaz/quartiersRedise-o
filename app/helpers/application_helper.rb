module ApplicationHelper



def esfrances
     if I18n.locale.to_s=='fr'
      return true
     else 
       return false 
     end
  end
def spanish
   if I18n.locale.to_s=='es'
      return true
     else 
       return false 
     end
  end
  

 def setspanish
  I18n.locale = 'es'
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
