class AddUsuarioforoidToComentarios < ActiveRecord::Migration
  def self.up
    add_column :comentarios, :usuarioforo_id, :integer
  end

  def self.down
    remove_column :comentarios, :usuarioforo_id
  end
end
