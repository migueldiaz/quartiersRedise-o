class AddTipoToDocumento < ActiveRecord::Migration
  def self.up
      add_column :documentos, :tipo, :integer, :default=>0

  end

  def self.down
      remove_column :documentos, :tipo
  end
end
