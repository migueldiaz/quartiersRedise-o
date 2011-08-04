class Jeunes < ActiveRecord::Base
  belongs_to :web
  has_one :sitio
  has_many :equipos
end
