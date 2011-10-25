class CreateVisions < ActiveRecord::Migration
  def self.up
    create_table :visions do |t|
      t.references :sitio

    end
  end

  def self.down
    drop_table :visions
  end
end
