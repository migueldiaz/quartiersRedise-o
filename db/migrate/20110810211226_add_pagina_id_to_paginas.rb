class AddPaginaIdToPaginas < ActiveRecord::Migration
  def self.up
    add_column :paginas, :pagina_id, :integer
  end

  def self.down
    remove_column :paginas, :pagina_id
  end
end
