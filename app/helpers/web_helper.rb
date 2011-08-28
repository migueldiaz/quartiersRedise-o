module WebHelper

  
    def comprueba_admin_sel sitio_name, sitio
    if !sitio.nil?
      if sitio_name == 'jeunes' and !sitio.jeunes.nil? then 
        return "seleccionado"
        else if  sitio_name == 'asociacion' and !sitio.asociacion.nil? then
        return "seleccionado"
        else if  sitio_name == 'femmes' and !sitio.femmes.nil? then
        return "seleccionado"
        end
        end
     end
  end
  
  end 
end
