class AddProtagonistasToPaginas < ActiveRecord::Migration
  def self.up
    add_column :paginas, :protagonistas_id, :integer
  end

  def self.down
    remove_column :paginas, :protagonistas_id
  end
end
