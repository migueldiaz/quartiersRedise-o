class Presentacion < ActiveRecord::Base
  belongs_to :sitio
  has_one :seccion, :dependent => :destroy
end
