class AddRevisadoToColaboradors < ActiveRecord::Migration
  def self.up
    add_column :colaboradors, :revisado, :boolean,:default=>0 
  end

  def self.down
    remove_column :colaboradors, :revisado
  end
end
