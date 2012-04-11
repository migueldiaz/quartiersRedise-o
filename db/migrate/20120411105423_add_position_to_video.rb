class AddPositionToVideo < ActiveRecord::Migration
  def self.up
        add_column :videos, :position, :integer, :default => 0

  end

  def self.down
        remove_column :videos, :position

  end
end
