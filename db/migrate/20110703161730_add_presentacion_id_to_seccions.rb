class AddPresentacionIdToSeccions < ActiveRecord::Migration
  def self.up
    add_column :seccions, :presentacion_id, :integer
  end

  def self.down
    remove_column :seccions, :presentacion_id
  end
end
