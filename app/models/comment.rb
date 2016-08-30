class Comment < ApplicationRecord
  belongs_to :bike_route

  validates :name, :body, presence: { message: "не може бути пустим" }
end
