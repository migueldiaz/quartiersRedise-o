class AddTituloesToParrafos < ActiveRecord::Migration
  def self.up
    add_column :parrafos, :tituloes, :string
  end

  def self.down
    remove_column :parrafos, :tituloes
  end
end
