class AddEquipoToUsuarioforo < ActiveRecord::Migration
  def self.up
    add_column :usuarioforos, :equipo_id, :integer
  end

  def self.down
    remove_column :usuarioforos, :equipo_id
  end
end
