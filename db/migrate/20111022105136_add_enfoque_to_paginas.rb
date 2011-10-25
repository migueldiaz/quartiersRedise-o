class AddEnfoqueToPaginas < ActiveRecord::Migration
  def self.up
    add_column :paginas, :enfoque_id, :integer
  end

  def self.down
    remove_column :paginas, :enfoque_id
  end
end
