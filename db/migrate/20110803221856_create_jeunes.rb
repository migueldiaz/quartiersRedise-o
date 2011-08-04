class CreateJeunes < ActiveRecord::Migration
  def self.up
    create_table :jeunes do |t|
      t.references :web

      t.timestamps
    end
  end

  def self.down
    drop_table :jeunes
  end
end
