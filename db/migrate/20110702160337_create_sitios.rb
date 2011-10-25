class CreateSitios < ActiveRecord::Migration
  def self.up
    create_table :sitios do |t|
      t.string :nombreEs
      t.string :nombreFr
      t.string :tipo

      t.timestamps
    end
  end

  def self.down
    drop_table :sitios
  end
end
