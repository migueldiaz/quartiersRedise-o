class AddComentarioidToComentarios < ActiveRecord::Migration
  def self.up
    add_column :comentarios, :comentario_id, :integer
  end

  def self.down
    remove_column :comentarios, :comentario_id
  end
end
