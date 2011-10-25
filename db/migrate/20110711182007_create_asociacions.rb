class CreateAsociacions < ActiveRecord::Migration
  def self.up
    create_table :asociacions do |t|
      t.references :web

    end
  end

  def self.down
    drop_table :asociacions
  end
end
