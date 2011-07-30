class AddArchivoToDocumentos < ActiveRecord::Migration
  def self.up
    add_column :documentos, :archivo, :string
  end

  def self.down
    remove_column :documentos, :archivo
  end
end
