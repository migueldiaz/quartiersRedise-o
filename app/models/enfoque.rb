class Enfoque < ActiveRecord::Base
  belongs_to :sitio
  has_many :paginas
end
