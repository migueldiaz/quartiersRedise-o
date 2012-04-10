class AddThumbnailToVideo < ActiveRecord::Migration
  def self.up
  add_column :videos, :thumbnail, :string

  end

  def self.down
 remove_column :videos, :thumbnail
  end
end
