class AddRedIdToSeccions < ActiveRecord::Migration
  def self.up
    add_column :seccions, :red_id, :integer
  end

  def self.down
    remove_column :seccions, :red_id
  end
end
