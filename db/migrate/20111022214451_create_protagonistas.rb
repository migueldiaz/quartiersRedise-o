class CreateProtagonistas < ActiveRecord::Migration
  def self.up
    create_table :protagonistas do |t|
      t.references :sitio

      t.timestamps
    end
  end

  def self.down
    drop_table :protagonistas
  end
end
