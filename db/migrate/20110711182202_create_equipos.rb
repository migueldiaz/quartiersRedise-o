class CreateEquipos < ActiveRecord::Migration
  def self.up
    create_table :equipos do |t|
      t.references :web

      t.timestamps
    end
  end

  def self.down
    drop_table :equipos
  end
end
