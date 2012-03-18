class Sitio < ActiveRecord::Base
  has_one :protagonistas, :dependent => :destroy
  has_one :enfoque, :dependent => :destroy
  has_one :vision, :dependent => :destroy
  has_one :presentacion, :dependent => :destroy
  has_one :documentacion, :dependent => :destroy
  has_one :red, :dependent => :destroy
  has_one :contacto, :dependent => :destroy
  has_many :eventos, :dependent => :destroy
  has_many :colaboradors, :dependent => :destroy
  has_many:usuarios, :dependent => :destroy
  has_many :equipos, :dependent => :destroy
  has_many :foros, :dependent =>:destroy
  has_many :fondos,:dependent =>:destroy
  #has_many :paginas ,:through=>:presentacion
  #has_many :paginas ,:through=>:red,:through=>:presentacion
 # has_many :paginas ,:through=>:documentacion
  #has_many :documentos, :through => :paginas
  
  belongs_to :jeunes
  belongs_to :femmes
  belongs_to :asociacion
  belongs_to :proyecto
  belongs_to :equipo,:foreign_key => "equipo_id"
  
  def paginas
   self.red.paginas+self.presentacion.paginas+self.documentacion.paginas
  end
  
  
end
