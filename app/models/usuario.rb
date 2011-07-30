class Usuario < ActiveRecord::Base
  attr_accessible :email,:nombre, :password, :password_confirmation,:tipo,:sitio_id,:traduceA
  attr_accessor :password
  
  validates :nombre, :presence => true, :on =>:save
  
  before_save :encrypt_password
  
  validates_uniqueness_of :nombre,:on=>:save
  validates_uniqueness_of :email,:on=>:save
  validates_confirmation_of :password,:on=>:save
  validates_presence_of :password,:on=>:save
  #validates_presence_of :password_confirmation
 
  validates_presence_of :email,:on=> :save
  validates_presence_of :nombre,:on=>:save
  belongs_to :sitio
 
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
