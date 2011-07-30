class AddTraduceAToUsuarios < ActiveRecord::Migration
  def self.up
    add_column :usuarios, :traduceA, :string
  end

  def self.down
    remove_column :usuarios, :traduceA
  end
end
