class Imagen < ActiveRecord::Base
  mount_uploader :imagen,ImagenUploader
  belongs_to :pagina
end
