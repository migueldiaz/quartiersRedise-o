class CreateUsuarios < ActiveRecord::Migration
  def self.up
    create_table :usuarios do |t|
      t.string :nombre
      t.string :email
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.references :sitio

    end
  end

  def self.down
    drop_table :usuarios
  end
end
