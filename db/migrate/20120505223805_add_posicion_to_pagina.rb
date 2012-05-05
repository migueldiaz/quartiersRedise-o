class AddPosicionToPagina < ActiveRecord::Migration
  def self.up
        add_column :paginas, :position, :integer, :default => 0

  end

  def self.down
        remove_column :paginas, :position

  end
end
