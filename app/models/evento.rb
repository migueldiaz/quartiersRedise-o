class Evento < ActiveRecord::Base
  mount_uploader :imagen,ImagenUploader
  mount_uploader :documento,DocumentoUploader
  mount_uploader :documentofr,DocumentoUploader
  belongs_to :sitio
  validate :valida_titulo
  def valida_titulo
   errors.add_to_base 'avisoevento' if tituloEs.blank? and tituloFr.blank? 
 end
end
