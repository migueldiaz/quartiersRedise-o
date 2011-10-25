class CreateAddProtagonistasToPaginas < ActiveRecord::Migration
  def self.up
    create_table :add_protagonistas_to_paginas do |t|
      t.integer :protagonistas_id

      t.timestamps
    end
  end

  def self.down
    drop_table :add_protagonistas_to_paginas
  end
end
