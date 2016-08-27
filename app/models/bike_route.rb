class BikeRoute < ApplicationRecord
  belongs_to :user

  validates :title, :description, :user_id, presence: { message: "не може бути пустим" }
  validates :description, length: { minimum: 8, message: " занадто короткий" }
end
