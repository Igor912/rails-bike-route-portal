class CreateBikeRoutes < ActiveRecord::Migration[5.0]
  def change
    create_table :bike_routes do |t|
      t.string :title
      t.text :description
      t.string :user_name
      t.integer :rating

      t.timestamps
    end
  end
end
