class AddRevisadofrToComentarios < ActiveRecord::Migration
  def self.up
    add_column :comentarios, :revisadofr, :boolean
  end

  def self.down
    remove_column :comentarios, :revisadofr
  end
end
