class AddRedidToPaginas < ActiveRecord::Migration
  def self.up
    add_column :paginas, :red_id, :integer
  end

  def self.down
    remove_column :paginas, :red_id
  end
end
