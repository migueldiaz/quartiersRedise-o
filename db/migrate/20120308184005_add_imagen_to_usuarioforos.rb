class AddImagenToUsuarioforos < ActiveRecord::Migration
  def self.up
    add_column :usuarioforos, :imagen, :string
  end

  def self.down
    remove_column :usuarioforos, :imagen
  end
end
