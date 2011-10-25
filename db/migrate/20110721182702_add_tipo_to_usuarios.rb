class AddTipoToUsuarios < ActiveRecord::Migration
  def self.up
    add_column :usuarios, :tipo, :string
  end

  def self.down
    remove_column :usuarios, :tipo
  end
end
