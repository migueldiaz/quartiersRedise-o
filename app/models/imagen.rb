class Imagen < ActiveRecord::Base
  mount_uploader :imagen,ImagenUploader
  mount_uploader :imagenmini,ImagenminiUploader
  belongs_to :pagina
end
