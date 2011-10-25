module BusquedasHelper
  def enlacepagina(pagina)
  if !pagina.presentacion.nil?
    presentacion=pagina.presentacion
    if !presentacion.sitio.jeunes.nil?
       return  link_to pagina.tituloes, jeunes_pagina_path(:id=>pagina) 
    end
  end
  ##por completar demas supuestos
  
  end
  
  
  
  
  def muestrapagina(parrafo)
   @parrafo=parrafo
   
   if !@parrafo.pagina.presentacion.nil?
     
      @presentacion=@parrafo.pagina.presentacion
      if !@presentacion.sitio.jeunes.nil?
         return link_to parrafo.tituloes,jeunes_pagina_path(:id=>parrafo.pagina)
      elsif !@presentacion.sitio.femmes.nil?
          return link_to parrafo.tituloes,femmes_pagina_path(:id=>parrafo.pagina)
      elsif !@presentacion.sitio.equipo.nil?
          return link_to parrafo.tituloes,equipe_pagina_path(:id=>parrafo.pagina)
      else
           return link_to parrafo.tituloes,asociation_pagina_path(:id=>parrafo.pagina)
      end
  elsif !parrafo.pagina.red.nil?
       if !red.jeunes.nil?
         return link_to parrafo.tituloes,jeunes_pagina_path(:id=>parrafo.pagina)
      elsif !red.femmes.nil?
          return link_to parrafo.tituloes,femmes_pagina_path(:id=>parrafo.pagina)
      elsif !red.equipo.nil?
          return link_to parrafo.tituloes,equipe_pagina_path(:id=>parrafo.pagina)
      else
           return link_to parrafo.tituloes,asociation_pagina_path(:id=>parrafo.pagina)
      end
   else
       if !documentacion.jeunes.nil?
         return link_to parrafo.tituloes,jeunes_pagina_path(:id=>parrafo.pagina)
      elsif !documentacion.femmes.nil?
          return link_to parrafo.tituloes,femmes_pagina_path(:id=>parrafo.pagina)
      elsif !documentacion.equipo.nil?
          return link_to parrafo.tituloes,equipe_pagina_path(:id=>parrafo.pagina)
      else
           return link_to parrafo.tituloes,asociation_pagina_path(:id=>parrafo.pagina)
      end
   end
 end
end
