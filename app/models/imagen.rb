class Imagen < ActiveRecord::Base
  mount_uploader :imagen,ImagenUploader
  mount_uploader :imagenmini,ImagenUploader
  belongs_to :pagina
end
