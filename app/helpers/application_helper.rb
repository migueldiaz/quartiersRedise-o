module ApplicationHelper
  
  def thumbea valor
    valor.gsub!(/\/(?!.*\/)/, '/thumb_') unless valor.nil?
    puts valor
    valor
  end
 def linkea valor
   valor.gsub!(/desarrollo.quartiersdumonde.org/, "#{request.host}")
    texto=simple_format(valor)
    

 texto.gsub!(/\[.*?\]/){|e| if e.split("|").length>1 then "<a target='_self' href=\"#{e.split("|")[1].gsub(/\]/, '')}\">"+e.split("|")[0].gsub(/\[/, "")+"</a>" else e end }  
 #texto.gsub!(/\[.*?\]/){|e| e.split("|")[1].gsub(/\]/, '') unless e.split("|")[1].nil?}  
  return auto_link(texto)
 end
  
  def posiciona_video (videos, c)
    html=""
     videos.each do |video|
  if video.position==c.to_int
  html<<"<a name='video"+video.id.to_s+"'></a><h3>VIDEO: "+video.send(:titulo.to_s+local)+"</h3>"+video.html

end

end
  return html.html_safe
    
  end
  
  
  ##Helper que detecta si la pagina es jeunes
  def esjeunes(pagina)
  	@pagina=Pagina.find(pagina)
  	#return true
  	if !@pagina.presentacion.nil?
  	   return !@pagina.presentacion.sitio.jeunes.nil?
    elsif !@pagina.red.nil?
  	   return !@pagina.red.sitio.jeunes.nil?
    elsif !@pagina.documentacion.nil? 
  	   return !@pagina.documentacion.sitio.jeunes.nil?
  	end
  end
  ##La pagina es femmes
  def esfemmes(pagina)
  	@pagina=Pagina.find(pagina)
  	return true
  	if !@pagina.presentacion.nil?
  	   return !@pagina.presentacion.sitio.femmes.nil?
    elsif !@pagina.red.nil?
  	   return !@pagina.red.sitio.femmes.nil?
    elsif !@pagina.documentacion.nil? @pagina.documentacion.sitio.nil?
  	   return @pagina.documentacion.sitio..femmes.nil?
  	end
  end
  
  #La pagina es asociacion
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
  
  
  @amplia=false
def dame_class_izq
  if content_for?(:menu_izq)
    logger.info "amplia css...."+@amplia.to_s
    if @amplia
  "span-6 contenido_central"
    else
  "span-4 contenido_central"
    end
  end
end
def dame_class_dcha
  if content_for?(:menu_dcha)
  "span-4 contenido_central last"
  end
end

def dame_class_central
  span_central=17
  if @amplia
    span_central=15
  end
  if content_for?(:menu_izq) and content_for?(:menu_dcha)
  "span-13 contenido_central"
  elsif !content_for?(:menu_dcha) and content_for?(:menu_izq)
  "span-"+span_central.to_s+" contenido_central last"
  elsif !content_for?(:menu_izq) and content_for?(:menu_dcha)
  "span-"+span_central.to_s+" contenido_central "
  else
    "span-23 contenido_central last"
  end
end
  
end
