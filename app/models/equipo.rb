class Equipo < ActiveRecord::Base
  
  #validates_presence_of :nombre
  belongs_to :web
  has_one :sitio , :dependent => :destroy
end
