class Plant < ApplicationRecord
  extend FriendlyId
  friendly_id :common_name, use: :slugged

  has_one_attached :photo

  validates :watering_interval, presence: true

  has_many :watering_events, dependent: :destroy
  has_many :fertilizing_events, dependent: :destroy
  has_many :fertilizer_notifications, dependent: :destroy
  has_many :water_notifications, dependent: :destroy
  belongs_to :user
end
