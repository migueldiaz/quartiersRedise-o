class AddDescripcionToContactos < ActiveRecord::Migration
  def self.up
    add_column :contactos, :descripciones, :text
    add_column :contactos, :descripcionfr, :text
  end

  def self.down
    remove_column :contactos, :descripcionfr
    remove_column :contactos, :descripciones
  end
end
