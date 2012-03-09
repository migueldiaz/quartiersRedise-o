class AddCambiosToEquipos < ActiveRecord::Migration
  def self.up
    add_column :equipos, :url, :string
    add_column :equipos, :imagen, :string
  end

  def self.down
    remove_column :equipos, :imagen
    remove_column :equipos, :url
  end
end
