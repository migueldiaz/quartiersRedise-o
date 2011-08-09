class Foro < ActiveRecord::Base
  has_many :documentos,:dependent=>:destroy
  has_many :comentarios,:dependent=>:destroy
  belongs_to :sitio
  validate :valida_titulo
 
	def valida_titulo
  		errors.add_to_base 'avisotitulo' if tituloes.blank? and titulofr.blank? 
	end
end
