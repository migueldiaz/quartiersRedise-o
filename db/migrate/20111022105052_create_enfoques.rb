class CreateEnfoques < ActiveRecord::Migration
  def self.up
    create_table :enfoques do |t|
      t.references :sitio

      t.timestamps
    end
  end

  def self.down
    drop_table :enfoques
  end
end
