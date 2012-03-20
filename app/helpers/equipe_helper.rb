module EquipeHelper
  
  def dame_paginas_presentaciones
    @sitio=@equipo.sitio
  id_presentacion=Presentacion.where("sitio_id= :id_sitio",{:id_sitio=>@sitio.id}).first.id
  Pagina.where("presentacion_id=:e_id", {:e_id=>id_presentacion})
  end
  def dame_paginas_actividades
    @sitio=@equipo.sitio
  id_red=Red.where("sitio_id= :id_sitio",{:id_sitio=>@sitio.id}).first.id
  Pagina.where("red_id=:e_id", {:e_id=>id_red})
  end
  def dame_paginas_documentacion
    @sitio=@equipo.sitio
  id_doc=Documentacion.where("sitio_id= :id_sitio",{:id_sitio=>@sitio.id}).first.id
  Pagina.where("documentacion_id=:e_id", {:e_id=>id_doc})
  end
end
