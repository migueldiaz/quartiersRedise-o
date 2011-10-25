class AddRevisadofrToColaboradors < ActiveRecord::Migration
  def self.up
    add_column :colaboradors, :revisadofr, :boolean,:default=>0 
    add_column :contactos, :revisadofr, :boolean,:default=>0 
    add_column :documentos, :revisadofr, :boolean,:default=>0 
    add_column :equipos, :revisadofr, :boolean,:default=>0 
    add_column :eventos, :revisadofr, :boolean,:default=>0 
    add_column :parrafos, :revisadofr, :boolean,:default=>0 
    add_column :paginas, :revisadofr, :boolean,:default=>0 
    add_column :seccions, :revisadofr, :boolean,:default=>0 
  end

  def self.down
    remove_column :paginas, :revisadofr
    remove_column :colaboradors, :revisadofr
    remove_column :contactos, :revisadofr
    remove_column :documentos, :revisadofr
    remove_column :equipos, :revisadofr
    remove_column :eventos, :revisadofr
    remove_column :parrafos, :revisadofr
    remove_column :seccions, :revisadofr
  end
end
