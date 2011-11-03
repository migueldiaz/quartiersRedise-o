class Usuarioforo < ActiveRecord::Base
  belongs_to :jeunes
  belongs_to :femmes
  belongs_to :equipo
  has_many :comentarios
 # validates_uniqueness_of :email
  validate :validaemail,:on=>:create

  def validaemail

    if jeunes_id
   	  @jeunes=Jeunes.first
   	  @usuarios=@jeunes.usuarioforos

   	elsif femmes_id
   	  @femmes=Femmes.first
   	  @usuarios=@femmes.usuarioforos
    end

    localizado=false

    @usuarios.each do |usuario|
       if usuario.email==email
            localizado=true

        end
     end
   	if  localizado==true
   	  errors.add_to_base 'emailenuso'
   	end
  
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
