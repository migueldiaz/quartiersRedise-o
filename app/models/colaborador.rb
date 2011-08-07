class Colaborador < ActiveRecord::Base
 mount_uploader :imagen,ImagenUploader 
 belongs_to :sitio
 
 #attr_accessor :nombreEs, :nombreFr
end
