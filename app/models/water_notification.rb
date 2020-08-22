class WaterNotification < ApplicationRecord
  belongs_to :plant

  validates :date, presence: true
end
