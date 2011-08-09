class CreateForos < ActiveRecord::Migration
  def self.up
    create_table :foros do |t|
      t.string :tituloes
      t.string :titulofr
      t.references :sitio

      t.timestamps
    end
  end

  def self.down
    drop_table :foros
  end
end
