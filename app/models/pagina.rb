class Pagina < ActiveRecord::Base
belongs_to :seccion
has_many :parrafos, :dependent => :destroy
has_many :documentos, :dependent => :destroy
end
