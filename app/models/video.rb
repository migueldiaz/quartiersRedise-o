class Video < ActiveRecord::Base
acts_as_indexed :fields => [:tituloes, :titulofr]
belongs_to :pagina
end
