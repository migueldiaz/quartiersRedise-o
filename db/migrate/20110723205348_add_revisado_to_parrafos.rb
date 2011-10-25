class AddRevisadoToParrafos < ActiveRecord::Migration
  def self.up
    add_column :parrafos, :revisado, :boolean,:default=>0 
  end

  def self.down
    remove_column :parrafos, :revisado
  end
end
