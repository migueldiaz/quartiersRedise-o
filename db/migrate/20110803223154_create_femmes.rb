class CreateFemmes < ActiveRecord::Migration
  def self.up
    create_table :femmes do |t|
      t.references :web

      t.timestamps
    end
  end

  def self.down
    drop_table :femmes
  end
end
