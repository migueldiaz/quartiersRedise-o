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


end
