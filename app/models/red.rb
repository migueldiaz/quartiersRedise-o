class Red < ActiveRecord::Base
  belongs_to :sitio
  has_many :paginas, :dependent => :destroy
end
