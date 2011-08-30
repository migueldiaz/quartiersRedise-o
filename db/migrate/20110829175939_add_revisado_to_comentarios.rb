class AddRevisadoToComentarios < ActiveRecord::Migration
  def self.up
    add_column :comentarios, :revisado, :boolean,:default=>0 
  end

  def self.down
    remove_column :comentarios, :revisado
  end
end
