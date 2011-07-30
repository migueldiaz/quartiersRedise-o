class CreateColaboradors < ActiveRecord::Migration
  def self.up
    create_table :colaboradors do |t|
      t.string :nombreEs
      t.string :nombreFr
      t.boolean :aporta
      t.text :infoEs
      t.text :infoFr
      t.text :direccion
      t.string :imagen
      t.references :sitio

      t.timestamps
    end
  end

  def self.down
    drop_table :colaboradors
  end
end
