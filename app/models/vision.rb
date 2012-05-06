class Vision < ActiveRecord::Base
  belongs_to :sitio
  has_one :pagina, :order => "position ASC"
end
