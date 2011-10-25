class AddNombreToEquipos < ActiveRecord::Migration
  def self.up
    add_column :equipos, :nombre, :string
  end

  def self.down
    remove_column :equipos, :nombre
  end
end
