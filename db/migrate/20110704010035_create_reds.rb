class CreateReds < ActiveRecord::Migration
  def self.up
    create_table :reds do |t|
      t.references :sitio

      t.timestamps
    end
  end

  def self.down
    drop_table :reds
  end
end
