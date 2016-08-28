class BikeRoute < ApplicationRecord
  belongs_to :user

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :title, :description, :user_id, presence: { message: "не може бути пустим" }
  validates :description, length: { minimum: 8, message: " занадто короткий" }
end
