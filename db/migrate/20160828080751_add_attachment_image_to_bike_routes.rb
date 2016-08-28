class AddAttachmentImageToBikeRoutes < ActiveRecord::Migration
  def self.up
    change_table :bike_routes do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :bike_routes, :image
  end
end
