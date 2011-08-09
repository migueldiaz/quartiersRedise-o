class CreateProyectos < ActiveRecord::Migration
  def self.up
    create_table :proyectos do |t|
      t.references :web

    end
  end

  def self.down
    drop_table :proyectos
  end
end
