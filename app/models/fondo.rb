class Fondo < ActiveRecord::Base
  belongs_to :sitio
  mount_uploader :imagen,FondoUploader
end
