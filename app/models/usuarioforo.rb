class Usuarioforo < ActiveRecord::Base
  belongs_to :jeunes
  belongs_to :femmes
 # has_one :equipo
  has_many :comentarios
 validates_uniqueness_of :email
  def tipo
    ""
  end
  # el password no se utiliza, el usuario se confronta con el mail y la clave es de foro jeunes/femme
   def self.authenticate(email, password)
    usuario = find_by_email(email)
    if usuario
      usuario
    else
      nil
    end
  end
  
end
