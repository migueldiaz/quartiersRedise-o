class AddPresentacionidToPaginas < ActiveRecord::Migration
  def self.up
    add_column :paginas, :presentacion_id, :integer
  end

  def self.down
    remove_column :paginas, :presentacion_id
  end
end
