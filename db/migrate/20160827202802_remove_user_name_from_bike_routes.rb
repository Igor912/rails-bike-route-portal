class RemoveUserNameFromBikeRoutes < ActiveRecord::Migration[5.0]
  def change
    remove_column :bike_routes, :user_name, :string
  end
end
