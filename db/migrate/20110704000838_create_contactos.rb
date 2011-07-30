class CreateContactos < ActiveRecord::Migration
  def self.up
    create_table :contactos do |t|
      t.text :infoEs
      t.text :infoFr
      t.string :email
      t.integer :sitio_id

      t.timestamps
    end
  end

  def self.down
    drop_table :contactos
  end
end
