class Jeunes < ActiveRecord::Base
  belongs_to :web
  has_one :sitio
   has_one :clave
  has_many :equipos
   has_many :usuarioforos
end
