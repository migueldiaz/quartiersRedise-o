class CreatePresentacions < ActiveRecord::Migration
  def self.up
    create_table :presentacions do |t|
      t.references :sitio
    end
  end

  def self.down
    drop_table :presentacions
  end
end
