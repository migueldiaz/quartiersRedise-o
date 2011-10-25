class AddIdiomaToUsuarioforos < ActiveRecord::Migration
  def self.up
    add_column :usuarioforos, :idioma, :string
  end

  def self.down
    remove_column :usuarioforos, :idioma
  end
end
