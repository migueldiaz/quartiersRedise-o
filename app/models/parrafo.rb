class Parrafo < ActiveRecord::Base
  belongs_to :pagina
  mount_uploader :imagen,ImagenUploader
  mount_uploader :imagenmini,ImagenUploader
  
  validate :valida_parrafo
 
   searchable do
  	  	text :textoes
   		text :textofr
   		text :piefoto
   		text :piefotofr
   		text :tituloes
   		text :titulofr
   		
    end
 
 
def valida_parrafo
  errors.add_to_base 'avisoparrafo' if textoes.blank? and textofr.blank? 
end  
  
end
