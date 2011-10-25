class AddCoordenadasToEquipos < ActiveRecord::Migration
  def self.up
    add_column :equipos, :x, :float
    add_column :equipos, :y, :float
  end

  def self.down
    remove_column :equipos, :y
    remove_column :equipos, :x
  end
end
