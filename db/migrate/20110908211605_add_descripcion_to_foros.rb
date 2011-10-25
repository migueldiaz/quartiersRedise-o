class AddDescripcionToForos < ActiveRecord::Migration
  def self.up
    add_column :foros, :descripciones, :text
    add_column :foros, :descripcionfr, :text
  end

  def self.down
    remove_column :foros, :descripcionfr
    remove_column :foros, :descripciones
  end
end
