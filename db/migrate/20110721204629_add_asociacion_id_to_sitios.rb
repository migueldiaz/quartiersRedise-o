class AddAsociacionIdToSitios < ActiveRecord::Migration
  def self.up
    add_column :sitios, :asociacion_id, :integer
  end

  def self.down
    remove_column :sitios, :asociacion_id
  end
end
