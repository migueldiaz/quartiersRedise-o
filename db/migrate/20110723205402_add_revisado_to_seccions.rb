class AddRevisadoToSeccions < ActiveRecord::Migration
  def self.up
    add_column :seccions, :revisado, :boolean,:default=>0 
  end

  def self.down
    remove_column :seccions, :revisado
  end
end
