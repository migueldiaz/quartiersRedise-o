class AddDocumentoToEventos < ActiveRecord::Migration
  def self.up
    add_column :eventos, :documento, :string
   add_column :eventos, :documentofr, :string
  end

  def self.down
    remove_column :eventos, :documento
     remove_column :eventos, :documentofr
  end
end
