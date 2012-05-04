module AsociacionHelper

#def define_class_en_funcion_fichas_laterales
  
 # if content_for?(:menu_izq)
  #logger.info "hola_menu_Izq"
  #+content_for(:menu_izq)
  #end
  #if content_for?(:menu_dcha)
  #logger.info "hola_menu_dcha"+content_for(:menu_dcha)
  #end
#end

def dame_sitio pagina
  if !pagina.presentacion.nil?
        pagina.presentacion.sitio
    elsif !pagina.red.nil?
        pagina.red.sitio
      elsif !pagina.vision.nil?
          pagina.vision.sitio
      elsif !pagina.enfoque.nil?
          pagina.enfoque.sitio
      elsif !pagina.protagonistas.nil?
          pagina.protagonistas.sitio
    end
end

def dame_proyecto pagina
  sitio=dame_sitio pagina
  if !sitio.jeunes.nil?
    "jeunes"
  elsif !sitio.femmes.nil?
    "femmes"
  elsif !sitio.asociacion.nil?
    "asociation"
  else
    "equipe"
    
  end
  
end

def dame_enfoque_paginas
  id_sitio=Sitio.where("asociacion_id=1").first.id
  id_enfoque=Enfoque.where("sitio_id= :id_sitio",{:id_sitio=>id_sitio}).first.id
  Pagina.where("enfoque_id=:e_id", {:e_id=>id_enfoque})
end
def dame_quienes_somos_paginas
  id_sitio=Sitio.where("asociacion_id=1").first.id
  id_presentacion=Presentacion.where("sitio_id= :id_sitio",{:id_sitio=>id_sitio}).first.id
  Pagina.where("presentacion_id=:e_id", {:e_id=>id_presentacion})
end
def dame_protagonistas_paginas
  id_sitio=Sitio.where("asociacion_id=1").first.id
  id_protagonistas=Protagonistas.where("sitio_id= :id_sitio",{:id_sitio=>id_sitio}).first.id
  Pagina.where("protagonistas_id=:e_id", {:e_id=>id_protagonistas})
end

def dame_path doc
  if doc.pagina.nil?
    "pagina nula: #{doc.doces}"
  else
    "el path de #{doc.pagina}" 
  end    
end


end
