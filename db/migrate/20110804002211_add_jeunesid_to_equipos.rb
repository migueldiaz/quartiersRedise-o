class AddJeunesidToEquipos < ActiveRecord::Migration
  def self.up
    add_column :equipos, :jeunes_id, :integer
  end

  def self.down
    remove_column :equipos, :jeunes_id
  end
end
