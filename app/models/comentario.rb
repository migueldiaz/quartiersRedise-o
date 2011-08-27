class Comentario < ActiveRecord::Base
  belongs_to :foro,:foreign_key => "foro_id"
  has_many :comentarios,:dependent=>:destroy
  belongs_to :usuarioforo
 #attr_accessor :textoes,:textofr,:comentario
  
   validate :valida_comentario
 
	def valida_comentario
  		errors.add_to_base 'avisocomentario' if textoes.blank? and textofr.blank? ||  tituloes.blank? and titulofr.blank?
	end
end
