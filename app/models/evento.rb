class Evento < ActiveRecord::Base
  mount_uploader :imagen,ImagenUploader
  belongs_to :sitio
  validate :valida_titulo
  def valida_titulo
   errors.add_to_base 'avisoevento' if tituloEs.blank? and tituloFr.blank? 
 end
end
