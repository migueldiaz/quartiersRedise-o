class Documento < ActiveRecord::Base
  belongs_to :pagina
  belongs_to :foro
  mount_uploader :archivo,DocumentoUploader
  mount_uploader :archivofr,DocumentoUploader

  validate :valida_enlacetitulo
  validate :valida_titulo
 
def valida_enlacetitulo
  errors.add_to_base 'avisoenlacefr' if docfr.blank? and !archivofr_url.blank? 
  errors.add_to_base 'avisoenlacees' if doces.blank? and !archivo_url.blank? 
end 
def valida_titulo
   errors.add_to_base 'avisodocumento' if doces.blank? and docfr.blank? 
end
end
