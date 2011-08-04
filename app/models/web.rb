class Web < ActiveRecord::Base
  has_one  :asociacion
  has_one  :jeunes
  has_one  :femmes
  
end
