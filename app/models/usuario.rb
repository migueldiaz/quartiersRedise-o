class Usuario < ActiveRecord::Base
   belongs_to :sitio
  
  #attr_accessible :email,:nombre, :password, :password_confirmation,:tipo,:sitio_id,:traduceA,:idioma
  attr_accessor :password
  
  before_save :encrypt_password
  
  validates_uniqueness_of :nombre
  validates_uniqueness_of :email
  validates_confirmation_of :password,:on=>:create
  validates_presence_of :password,:on=>:create
  #validates_presence_of :password_confirmation
 
  validates_presence_of :email
  validates_presence_of :nombre
 

  def self.authenticate(nombre, password)
    usuario = find_by_nombre(nombre)
    if usuario && usuario.password_hash == BCrypt::Engine.hash_secret(password, usuario.password_salt)
      usuario
    else
      nil
    end
  end
 
  def encrypt_password
   if password.present?
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password,password_salt)
   end
  end
  
  
  
 
end
