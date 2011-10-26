class Comentario < ActiveRecord::Base
  belongs_to :foro,:foreign_key => "foro_id"
  has_many :comentarios,:dependent=>:destroy
  belongs_to :usuarioforo
 #attr_accessor :textoes,:textofr,:comentario
  
   validate :valida_comentario
 
	def valida_comentario
  		errors.add_to_base 'avisocomentario' if textoes.blank? and textofr.blank? ||  tituloes.blank? and titulofr.blank?
	end
  
   def created_at_admin=(date)
    fragmentos=date.to_s.split
    fecha=fragmentos[0].split("/")
    fecha_format=[fecha[2], fecha[1],fecha[0]].join("/")
    logger.info("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"+date)
    logger.info("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"+fecha_format+" "+fragmentos[1])
    
        write_attribute(:created_at,fecha_format+" "+fragmentos[1])

  end
end
