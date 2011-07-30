class AddRevisadoToEventos < ActiveRecord::Migration
  def self.up
    add_column :eventos, :revisado, :boolean,:default=>0    
  end

  def self.down
    remove_column :eventos, :default
  end
end
