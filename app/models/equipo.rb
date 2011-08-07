class Equipo < ActiveRecord::Base
  
  #validates_presence_of :nombre
  belongs_to :jeunes
  belongs_to :femmes
  has_one :sitio , :dependent => :destroy
  
  validates_presence_of :nombre
end
