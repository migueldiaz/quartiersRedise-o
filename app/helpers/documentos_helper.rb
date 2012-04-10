module DocumentosHelper
def tipos_as 
  {'no asignado'=>0, t('tipos_as_1') => 1, 'formaciones' => 2,'estudios y trabajos' => 3,'articulos, participaciones a conferencias' => 4,'publicaciones' => 5,'textos de referencia' => 6,'galerias de fotos' => 7}
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
  {'no asignado'=>0, 'informes de actividades y sistematizacion' => 1, 'informes de formacion' => 2,'otros documentos' => 3}
end
def tipos_jeunes
  tipos_femmes
end
end
