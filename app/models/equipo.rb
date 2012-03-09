class Equipo < ActiveRecord::Base
  mount_uploader :imagen,ImagenUploader
  #validates_presence_of :nombre
  belongs_to :jeunes
  belongs_to :femmes
  has_one :sitio #, :dependent => :destroy
  has_many :usuarioforos
#  searchable do
#   		text :nombre
#   		text :descripcionEs
#   		text :descripcionFr
#    end
  
  validates_presence_of :nombre
end
