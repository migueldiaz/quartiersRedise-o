class CreateImagens < ActiveRecord::Migration
  def self.up
    create_table :imagens do |t|
      t.string :piefoto
      t.string :piefotofr
      t.string :imagen
      t.references :pagina

    end
  end

  def self.down
    drop_table :imagens
  end
end
