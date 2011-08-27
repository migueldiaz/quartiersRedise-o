class CreateClaves < ActiveRecord::Migration
  def self.up
    create_table :claves do |t|
      t.string :clave
      t.references :jeunes
      t.references :femmes

      t.timestamps
    end
  end

  def self.down
    drop_table :claves
  end
end
