class AddEquipoIdToSitios < ActiveRecord::Migration
  def self.up
    add_column :sitios, :equipo_id, :integer
  end

  def self.down
    remove_column :sitios, :equipo_id
  end
end
