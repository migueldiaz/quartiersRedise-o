class AddDocumentacionIdToPaginas < ActiveRecord::Migration
  def self.up
    add_column :paginas, :documentacion_id, :integer
  end

  def self.down
    remove_column :paginas, :documentacion_id
  end
end
