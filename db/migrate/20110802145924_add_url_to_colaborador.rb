class AddUrlToColaborador < ActiveRecord::Migration
  def self.up
    add_column :colaboradors, :url, :string
  end

  def self.down
    remove_column :colaboradors, :url
  end
end
