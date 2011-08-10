class Sitio < ActiveRecord::Base
  
  has_one :presentacion, :dependent => :destroy
  has_one :documentacion, :dependent => :destroy
  has_one :red, :dependent => :destroy
  has_one :contacto, :dependent => :destroy
  has_many :eventos, :dependent => :destroy
  has_many :colaboradors, :dependent => :destroy
  has_many:usuarios, :dependent => :destroy
  has_many :equipos, :dependent => :destroy
  has_many :foros, :dependent =>:destroy
  
  belongs_to :jeunes
  belongs_to :femmes
  belongs_to :asociacion
  belongs_to :proyecto
  belongs_to :equipo
end
