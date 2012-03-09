class AddPositionToDocumentos < ActiveRecord::Migration
  def self.up
    add_column :documentos, :position, :integer, :default => 50
  end

  def self.down
    remove_column :documentos, :position
  end
end
