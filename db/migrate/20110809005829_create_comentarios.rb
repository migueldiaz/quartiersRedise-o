class CreateComentarios < ActiveRecord::Migration
  def self.up
    create_table :comentarios do |t|
      t.text :textoes
      t.text :textofr
      t.references :foro

      t.timestamps
    end
  end

  def self.down
    drop_table :comentarios
  end
end
