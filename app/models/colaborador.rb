class Colaborador < ActiveRecord::Base
 mount_uploader :imagen,ImagenColaboradorUploader 
 belongs_to :sitio

end
