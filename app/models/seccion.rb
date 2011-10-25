class Seccion < ActiveRecord::Base
belongs_to :presentacion,:foreign_key => "presentacion_id"
belongs_to :red,:foreign_key => "red_id"
has_many :paginas, :dependent => :destroy
end
