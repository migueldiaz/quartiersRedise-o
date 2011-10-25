class CreateFondos < ActiveRecord::Migration
  def self.up
    create_table :fondos do |t|
      t.string :imagen
      t.references :sitio

      t.timestamps
    end
  end

  def self.down
    drop_table :fondos
  end
end
