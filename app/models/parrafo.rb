class Parrafo < ActiveRecord::Base
  belongs_to :pagina
  mount_uploader :imagen,ImagenUploader
end
