class Traduccion 
  attr_accessor :resultado, :alternativaCSS
  
  def initialize(objeto, identificativo)
    aplica_trad(objeto,identificativo)
  end
  def aplica_trad(objeto, identificativo)
    tit_idioma=objeto.send(identificativo.to_s+I18n.locale.to_s)
    if tit_idioma!=nil && tit_idioma.strip!="" 
      @resultado=tit_idioma
    else
      @resultado=objeto.send(identificativo.to_s+dame_otro_idioma)
      @alternativaCSS=alternativa_idioma
    end
    puts("resssssssssssssssssss"+@resultado)
  end
  
 
  def dame_otro_idioma
     if I18n.locale.to_s=='fr'
      return 'es'
     else 
       return 'fr' 
     end
  end
def alternativa_idioma
  return "color:yellow;background-color:gray;"
end

end
