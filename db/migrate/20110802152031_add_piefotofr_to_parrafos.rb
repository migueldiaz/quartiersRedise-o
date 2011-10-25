class AddPiefotofrToParrafos < ActiveRecord::Migration
  def self.up
    add_column :parrafos, :piefotofr, :string
  end

  def self.down
    remove_column :parrafos, :piefotofr
  end
end
