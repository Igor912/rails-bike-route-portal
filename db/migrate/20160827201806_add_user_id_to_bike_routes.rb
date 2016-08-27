class AddUserIdToBikeRoutes < ActiveRecord::Migration[5.0]
  def change
    add_column :bike_routes, :user_id, :integer
  end
end
