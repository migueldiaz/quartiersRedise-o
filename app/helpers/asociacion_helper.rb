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

def dame_class_izq
  if content_for?(:menu_izq)
  "span-4 contenido_central"
  end
end
def dame_class_dcha
  if content_for?(:menu_dcha)
  "span-4 contenido_central last"
  end
end

def dame_class_central
  if content_for?(:menu_izq) and content_for?(:menu_dcha)
  "span-13 contenido_central"
  elsif !content_for?(:menu_dcha)
  "span-17 contenido_central last"
  elsif !content_for?(:menu_izq)
  "span-17 contenido_central "
  else
    "span-23 contenido_central last"
  end
end

def dame_enfoque_paginas
  id_sitio=Sitio.where("asociacion_id=1").first.id
  id_enfoque=Enfoque.where("sitio_id= :id_sitio",{:id_sitio=>id_sitio}).first.id
  Pagina.where("enfoque_id=:e_id", {:e_id=>id_enfoque})
end

end
