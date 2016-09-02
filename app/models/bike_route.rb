class BikeRoute < ApplicationRecord
  acts_as_votable
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_attached_file :image, styles: { medium: "600x350#", small: "400x300#", thumb: "130x100#" }, :storage => :s3, :s3_credentials => config.paperclip_defaults
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :title, :description, :user_id, presence: { message: "не може бути пустим" }
  validates :description, length: { minimum: 8, message: " занадто короткий" }
end
