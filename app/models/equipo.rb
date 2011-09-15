class Equipo < ActiveRecord::Base
  
  #validates_presence_of :nombre
  belongs_to :jeunes
  belongs_to :femmes
  has_one :sitio #, :dependent => :destroy
  
  #searchable do
  # 		text :nombre
  # 		text :descripcionEs
  # 		text :descripcionFr
  #  end
  
  validates_presence_of :nombre
end
