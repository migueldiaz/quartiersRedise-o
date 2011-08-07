class Contacto < ActiveRecord::Base
  belongs_to :sitio
  
  #validates_presence_of :email,:on=>:update
end
