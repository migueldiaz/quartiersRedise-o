class CreateFemmes < ActiveRecord::Migration
  def self.up
    create_table :femmes do |t|
      t.references :web
    end
  end

  def self.down
    drop_table :femmes
  end
end
