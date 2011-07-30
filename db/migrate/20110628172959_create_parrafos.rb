class CreateParrafos < ActiveRecord::Migration
  def self.up
    create_table :parrafos do |t|
      t.text :textoes
      t.text :textofr
      t.references :pagina

      t.timestamps
    end
  end

  def self.down
    drop_table :parrafos
  end
end
