class CreatePresentacions < ActiveRecord::Migration
  def self.up
    create_table :presentacions do |t|
      t.references :sitio

      t.timestamps
    end
  end

  def self.down
    drop_table :presentacions
  end
end
