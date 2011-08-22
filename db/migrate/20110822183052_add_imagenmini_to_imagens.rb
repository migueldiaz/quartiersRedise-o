class AddImagenminiToImagens < ActiveRecord::Migration
  def self.up
    add_column :imagens, :imagenmini, :string
  end

  def self.down
    remove_column :imagens, :imagenmini
  end
end
