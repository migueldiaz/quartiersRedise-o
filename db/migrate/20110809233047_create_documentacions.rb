class CreateDocumentacions < ActiveRecord::Migration
  def self.up
    create_table :documentacions do |t|
      t.references :sitio

      t.timestamps
    end
  end

  def self.down
    drop_table :documentacions
  end
end
