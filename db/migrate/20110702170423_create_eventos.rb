class CreateEventos < ActiveRecord::Migration
  def self.up
    create_table :eventos do |t|
      t.datetime :fecha
      t.string :tituloEs
      t.string :tituloFr
      t.string :imagen

    end
  end

  def self.down
    drop_table :eventos
  end
end
