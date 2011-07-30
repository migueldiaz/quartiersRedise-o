class AddSitioIdToEventos < ActiveRecord::Migration
  def self.up
    add_column :eventos, :sitio_id, :integer
  end

  def self.down
    remove_column :eventos, :sitio_id
  end
end
