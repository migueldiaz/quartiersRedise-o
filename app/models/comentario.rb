class Comentario < ActiveRecord::Base
  belongs_to :foro,:foreign_key => "foro_id"
  has_many :comentarios,:dependent=>:destroy
 # attr_accessor :textoes,:textofr
  
   validate :valida_comentario
 
	def valida_comentario
  		errors.add_to_base 'avisocomentario' if textoes.blank? and textoes.blank? 
	end
end
