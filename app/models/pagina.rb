class Pagina < ActiveRecord::Base

belongs_to :protagonistas,:foreign_key => "protagonistas_id"
belongs_to :enfoque,:foreign_key => "enfoque_id"
belongs_to :vision,:foreign_key => "vision_id"
belongs_to :presentacion,:foreign_key => "presentacion_id"
belongs_to :red,:foreign_key => "red_id"
belongs_to :documentacion,:foreign_key => "documentacion_id"
belongs_to :pagina,:foreign_key => "pagina_id"
has_many :parrafos, :dependent => :destroy, :order => "position ASC"
has_many :imagens, :dependent => :destroy
has_many :documentos, :dependent => :destroy, :order => "position ASC"
has_many :paginas, :dependent => :destroy, :order => "position ASC"
has_many :videos, :dependent => :destroy, :order => "position ASC"

validate :valida_titulo
 
 # searchable do
 #  		text :tituloes
 #  		text :titulofr
 #   end
 
def valida_titulo
  errors.add_to_base 'avisotitulo' if tituloes.blank? and titulofr.blank? 
end
#########
end
