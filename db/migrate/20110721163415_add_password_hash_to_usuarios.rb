class AddPasswordHashToUsuarios < ActiveRecord::Migration
  def self.up
    add_column :usuarios, :password_hash, :string
  end

  def self.down
    remove_column :usuarios, :password_hash
  end
end
