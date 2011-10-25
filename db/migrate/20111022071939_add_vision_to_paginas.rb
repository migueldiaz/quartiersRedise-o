class AddVisionToPaginas < ActiveRecord::Migration
  def self.up
    add_column :paginas, :vision_id, :integer
  end

  def self.down
    remove_column :paginas, :vision_id
  end
end
