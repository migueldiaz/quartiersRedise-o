class AddJeunesidToSitios < ActiveRecord::Migration
  def self.up
    add_column :sitios, :jeunes_id, :integer
  end

  def self.down
    remove_column :sitios, :jeunes_id
  end
end
