class Usuarioforo < ActiveRecord::Base
  belongs_to :jeunes
  belongs_to :femmes
  has_many :comentarios
  
   def self.authenticate(email, password)
    usuario = find_by_email(email)
    if usuario
      usuario
    else
      nil
    end
  end
end
