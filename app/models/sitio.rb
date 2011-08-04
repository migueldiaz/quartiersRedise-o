class Sitio < ActiveRecord::Base
  attr_accessible :nombreEs, :nombre_Fr, :tipo
  has_many :eventos, :dependent => :destroy
  has_one :presentacion, :dependent => :destroy
  has_one :red, :dependent => :destroy
  has_one :contacto, :dependent => :destroy
  has_many :colaboradors, :dependent => :destroy
  has_many:usuarios, :dependent => :destroy
  has_many :equipos, :dependent => :destroy
  belongs_to :jeunes
  belongs_to :femmes
  belongs_to :asociacion
  belongs_to :proyecto
  belongs_to :equipo
end
