class AddFemmesidToEquipos < ActiveRecord::Migration
  def self.up
    add_column :equipos, :femmes_id, :integer
  end

  def self.down
    remove_column :equipos, :femmes_id
  end
end
