class Enfoque < ActiveRecord::Base
  belongs_to :sitio
  has_many :paginas, :order => "position ASC"
end
