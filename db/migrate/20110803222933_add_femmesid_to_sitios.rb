class AddFemmesidToSitios < ActiveRecord::Migration
  def self.up
    add_column :sitios, :femmes_id, :integer
  end

  def self.down
    remove_column :sitios, :femmes_id
  end
end
