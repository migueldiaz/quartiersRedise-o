class AddForoidToDocumentos < ActiveRecord::Migration
  def self.up
    add_column :documentos, :foro_id, :integer
  end

  def self.down
    remove_column :documentos, :foro_id
  end
end
