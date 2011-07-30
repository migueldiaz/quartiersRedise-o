class CreatePaginas < ActiveRecord::Migration
  def self.up
    create_table :paginas do |t|
      t.string :tituloes
      t.string :titulofr

      t.timestamps
    end
  end

  def self.down
    drop_table :paginas
  end
end
