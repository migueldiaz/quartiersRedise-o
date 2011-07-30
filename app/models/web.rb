class Web < ActiveRecord::Base
  has_one  :asociacion
  has_one  :proyecto
  has_many :equipos
end
