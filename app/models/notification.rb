class Notification < ApplicationRecord
  belongs_to :plant

  has_one :user, through: :plant
end
