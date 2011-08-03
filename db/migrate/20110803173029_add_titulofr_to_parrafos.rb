class AddTitulofrToParrafos < ActiveRecord::Migration
  def self.up
    add_column :parrafos, :titulofr, :string
  end

  def self.down
    remove_column :parrafos, :titulofr
  end
end
