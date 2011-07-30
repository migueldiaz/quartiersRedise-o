class AddTipoToSeccions < ActiveRecord::Migration
  def self.up
    add_column :seccions, :tipo, :string
  end

  def self.down
    remove_column :seccions, :tipo
  end
end
