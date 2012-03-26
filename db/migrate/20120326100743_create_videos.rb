class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.string :tituloes
      t.string :titulofr
      t.text :html
      t.integer :pagina_id

      t.timestamps
    end
  end

  def self.down
    drop_table :videos
  end
end
