class Vision < ActiveRecord::Base
  belongs_to :sitio
  has_one :pagina
end
