class Red < ActiveRecord::Base
  belongs_to :sitio
  has_many :seccions, :dependent => :destroy
end
