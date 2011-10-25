class AddImagenToParrafos < ActiveRecord::Migration
  def self.up
    add_column :parrafos, :imagen, :string
  end

  def self.down
    remove_column :parrafos, :imagen
  end
end
