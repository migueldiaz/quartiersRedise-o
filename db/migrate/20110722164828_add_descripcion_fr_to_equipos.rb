class AddDescripcionFrToEquipos < ActiveRecord::Migration
  def self.up
    add_column :equipos, :descripcionFr, :text
  end

  def self.down
    remove_column :equipos, :descripcionFr
  end
end
