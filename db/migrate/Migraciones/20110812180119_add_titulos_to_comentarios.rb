class AddTitulosToComentarios < ActiveRecord::Migration
  def self.up
    add_column :comentarios, :tituloes, :string
    add_column :comentarios, :titulofr, :string
  end

  def self.down
    remove_column :comentarios, :titulofr
    remove_column :comentarios, :tituloes
  end
end
