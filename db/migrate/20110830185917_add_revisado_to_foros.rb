class AddRevisadoToForos < ActiveRecord::Migration
  def self.up
    add_column :foros, :revisado, :boolean,:default=>0 
    add_column :foros, :revisadofr, :boolean,:default=>0 
    add_column :imagens, :revisado, :boolean,:default=>0 
    add_column :imagens, :revisadofr, :boolean,:default=>0 
    
  end

  def self.down
    remove_column :imagens, :revisadofr
    remove_column :imagens, :revisado
    remove_column :foros, :revisadofr
    remove_column :foros, :revisado
  end
end
