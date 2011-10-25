class CreateSeccions < ActiveRecord::Migration
  def self.up
    create_table :seccions do |t|
      t.string :tituloes
      t.string :titulofr

      t.timestamps
    end
  end

  def self.down
    drop_table :seccions
  end
end
