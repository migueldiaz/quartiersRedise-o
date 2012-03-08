class AddDocumentofrToEventos < ActiveRecord::Migration
  def self.up
    
    add_column :eventos, :titulodoces, :string
    add_column :eventos, :titulodocfr, :string
  end

  def self.down
    remove_column :eventos, :titulodocfr
    remove_column :eventos, :titulodoces
   
  end
end
