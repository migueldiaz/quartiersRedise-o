module JeunesHelper
  
  def dame_presentacion_paginas
  id_sitio=Sitio.where("jeunes_id=1").first.id
  id_presentacion=Presentacion.where("sitio_id= :id_sitio",{:id_sitio=>id_sitio}).first.id
  Pagina.where("presentacion_id=:e_id", {:e_id=>id_presentacion})
end
  def dame_red_paginas
  id_sitio=Sitio.where("jeunes_id=1").first.id
  id_red=Red.where("sitio_id= :id_sitio",{:id_sitio=>id_sitio}).first.id
  Pagina.where("red_id=:e_id", {:e_id=>id_red})
end
  def dame_documentacion_paginas
  id_sitio=Sitio.where("jeunes_id=1").first.id
  id_doc=Documentacion.where("sitio_id= :id_sitio",{:id_sitio=>id_sitio}).first.id
  Pagina.where("documentacion_id=:e_id", {:e_id=>id_doc})
end

end
