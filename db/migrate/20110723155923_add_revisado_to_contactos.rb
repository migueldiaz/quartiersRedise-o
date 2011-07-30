class AddRevisadoToContactos < ActiveRecord::Migration
  def self.up
    add_column :contactos, :revisado, :boolean,:default=>0 
  end

  def self.down
    remove_column :contactos, :revisado
  end
end
