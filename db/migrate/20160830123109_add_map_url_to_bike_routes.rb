class AddMapUrlToBikeRoutes < ActiveRecord::Migration[5.0]
  def change
    add_column :bike_routes, :map_url, :string
  end
end
