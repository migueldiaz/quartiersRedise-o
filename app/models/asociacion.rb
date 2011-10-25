class Asociacion < ActiveRecord::Base
  belongs_to :web
  has_one :sitio
end
