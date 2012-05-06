class AddPositionToColaborador < ActiveRecord::Migration
  def self.up
        add_column :colaboradors, :position, :integer, :default => 0

  end

  def self.down
        remove_column :colaboradors, :position

  end
end
