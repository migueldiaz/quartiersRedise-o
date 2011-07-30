class AddDescripcionEsToEquipos < ActiveRecord::Migration
  def self.up
    add_column :equipos, :descripcionEs, :text
  end

  def self.down
    remove_column :equipos, :descripcionEs
  end
end
