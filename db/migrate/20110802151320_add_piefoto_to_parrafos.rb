class AddPiefotoToParrafos < ActiveRecord::Migration
  def self.up
    add_column :parrafos, :piefoto, :string
  end

  def self.down
    remove_column :parrafos, :piefoto
  end
end
