class CreateEquipos < ActiveRecord::Migration
  def self.up
    create_table :equipos do |t|
      t.references :web

    end
  end

  def self.down
    drop_table :equipos
  end
end
