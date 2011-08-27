class CreateUsuarioforos < ActiveRecord::Migration
  def self.up
    create_table :usuarioforos do |t|
      t.string :nombre
      t.string :email
      t.string :clave
      t.references :jeunes
      t.references :femmes

      t.timestamps
    end
  end

  def self.down
    drop_table :usuarioforos
  end
end
