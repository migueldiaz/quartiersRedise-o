module ApplicationHelper

def local
	I18n.locale.to_s
end

def js_slideshow colleccion
          resultado=""
           colleccion.each do  |fondo|
          resultado+="{image : '"+fondo.imagen.to_s+"', title:'', url:''}"
          resultado+="," if(colleccion.index(fondo)!=(colleccion.length-1))
        end
      resultado
end


def esfrances
     if I18n.locale.to_s=='fr'
      return true
     else 
       return false 
     end
  end

def alternativa_idioma
  return "color:yellow;"
end

def dame_otro_idioma
     if I18n.locale.to_s=='fr'
      return 'es'
     else 
       return 'fr' 
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

def dame_nombre_metodo valor
	if(I18n.locale.to_s=='es')
		valor
	else
		valor+"fr"
	end
end 
def alternativa_idioma
  return "color:yellow;background-color:gray;"
end

def dame_nombre_metodo_bis valor
  if(I18n.locale.to_s=='es')
    valor+"es"
  else
    valor+"fr"
  end
end 

def menu_seleccionada opcion
	if opcion.to_s == params[:action]
		return "class='seleccionado'"
	end
end

def menu_seleccionada_bis opcion
if request.url.include? opcion.to_s 
"class='seleccionado'"
end
end

def menu_seleccionada_tris opcion
if @seccion_menu == opcion 
"class='seleccionado'"
end
end


end
