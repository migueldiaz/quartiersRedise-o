class Pagina < ActiveRecord::Base
belongs_to :presentacion,:foreign_key => "presentacion_id"
belongs_to :red,:foreign_key => "red_id"
belongs_to :documentacion,:foreign_key => "documentacion_id"
belongs_to :pagina,:foreign_key => "pagina_id"
has_many :parrafos, :dependent => :destroy
has_many :imagens, :dependent => :destroy
has_many :documentos, :dependent => :destroy
has_many :paginas, :dependent => :destroy
validate :valida_titulo
 
def valida_titulo
  errors.add_to_base 'avisotitulo' if tituloes.blank? and titulofr.blank? 
end
#########
end
