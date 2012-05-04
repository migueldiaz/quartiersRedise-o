class AddTipoToVideo < ActiveRecord::Migration
 def self.up
      add_column :videos, :tipo, :integer, :default=>0

  end

  def self.down
      remove_column :videos, :tipo
  end
  end
