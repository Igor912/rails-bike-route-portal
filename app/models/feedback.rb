class Feedback < ApplicationRecord

  validates :name, :email, :description, presence: { message: "не може бути пустим" }

end
