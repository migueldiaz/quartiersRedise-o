class CreateDocumentos < ActiveRecord::Migration
  def self.up
    create_table :documentos do |t|
      t.string :doces
      t.string :docfr
      t.references :pagina
    end
  end

  def self.down
    drop_table :documentos
  end
end
