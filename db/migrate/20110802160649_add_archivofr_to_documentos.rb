class AddArchivofrToDocumentos < ActiveRecord::Migration
  def self.up
    add_column :documentos, :archivofr, :string
  end

  def self.down
    remove_column :documentos, :archivofr
  end
end
