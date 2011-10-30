class AddDescripcionToEventos < ActiveRecord::Migration
  def self.up
    add_column :eventos, :descripciones, :text
    add_column :eventos, :descripcionfr, :text
  end

  def self.down
    remove_column :eventos, :descripcionfr
    remove_column :eventos, :descripciones
  end
end
