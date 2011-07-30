class AddRevisadoToPaginas < ActiveRecord::Migration
  def self.up
    add_column :paginas, :revisado, :boolean,:default=>0 
  end

  def self.down
    remove_column :paginas, :revisado
  end
end
