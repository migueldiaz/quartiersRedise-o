module DocumentosHelper
def tipos_as 
  {t('no_asignado')=>0, t('tipos_as_1') => 1, t('tipos_as_2') => 2,t('tipos_as_3') => 3,t('tipos_as_4') => 4,t('tipos_as_5') => 5,t('tipos_as_6') => 6,t('tipos_as_7') => 7,t('tipos_as_8') => 8}
end



def dameTipos val
  logger.info val+"aaaa";
  if(val==3.to_s)
  tipos_femmes
elsif val==2.to_s
  tipos_jeunes
else
  tipos_as
  end
end

def dameNombre valor, coleccion
  coleccion.each do|name, grade|
  if grade==valor 
    return name
  end
  end
end

def tipos_femmes 
 tipos_as
end
def tipos_jeunes
  tipos_as
end
end
