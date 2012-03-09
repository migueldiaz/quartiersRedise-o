module ApplicationHelper
  
  ##Helper que detecta si la pagina es asociacion_> No tiene galeria
  ## En views -> paginas -> show -> linea 48
  def esasociacion(pagina)
  	@pagina=Pagina.find(pagina)
  	return true
  	if !@pagina.presentacion.nil?
  	   return !@pagina.presentacion.sitio.asociacion.nil?
    elsif !@pagina.enfoque.nil?
  	   return !@pagina.enfoque.sitio.asociacion.nil?
    elsif !@pagina.protagonistas.nil?
  	   return !@pagina.protagonistas.sitio.asociacion.nil? 
  	end
  end
  def nuevoscomentarios(identificador)
    
    @comentario=Comentario.find(identificador)
    @foro=@comentario.foro
    @comentarios=@foro.comentarios.all(:conditions => ["id > ?",identificador+1])
    # return @comentarios
  	  respond_to do |format|
      format.xml {render :xml =>  @comentarios.sort_by( &:created_at ).reverse.to_xml(:only => [:id, :tituloes,:textoes, :created_at,  :comentario_id],:include=>{:usuarioforo=>{:only=>[:id, :nombre, :email, :equipo_id]}})}
    end
  end
  
  
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
