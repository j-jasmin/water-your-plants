class FertilizerNotification < ApplicationRecord
  belongs_to :plant

  has_one :user, through: :plant

  validates :date, presence: true
end
