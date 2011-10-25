class Clave < ActiveRecord::Base
  belongs_to :jeunes,:foreign_key => "jeunes_id"
  belongs_to :femmes,:foreign_key => "femmes_id"
end
