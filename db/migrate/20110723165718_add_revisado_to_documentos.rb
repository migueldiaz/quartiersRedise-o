class AddRevisadoToDocumentos < ActiveRecord::Migration
  def self.up
    add_column :documentos, :revisado, :boolean,:default=>0 
  end

  def self.down
    remove_column :documentos, :revisado
  end
end
