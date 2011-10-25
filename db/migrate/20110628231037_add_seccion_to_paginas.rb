class AddSeccionToPaginas < ActiveRecord::Migration
  def self.up
    add_column :paginas, :seccion_id, :int
  end

  def self.down
    remove_column :paginas, :seccion_id
  end
end
