class Fondo < ActiveRecord::Base
  belongs_to :sitio
  mount_uploader :imagen,ImagenUploader
end
