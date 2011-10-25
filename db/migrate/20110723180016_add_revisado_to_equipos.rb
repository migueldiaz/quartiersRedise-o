class AddRevisadoToEquipos < ActiveRecord::Migration
  def self.up
    add_column :equipos, :revisado, :boolean,:default=>0 
  end

  def self.down
    remove_column :equipos, :revisado
  end
end
