class AddProyectoIdToSitios < ActiveRecord::Migration
  def self.up
    add_column :sitios, :proyecto_id, :integer
  end

  def self.down
    remove_column :sitios, :proyecto_id
  end
end
