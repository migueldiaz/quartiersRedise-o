class AddPositionToParrafos < ActiveRecord::Migration
  def self.up
    add_column :parrafos, :position, :integer, :default => 50
  end

  def self.down
    remove_column :parrafos, :position
  end
end
