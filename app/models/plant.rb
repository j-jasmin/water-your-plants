class Plant < ApplicationRecord
  has_one_attached :photo

  validates :common_name, presence: true
  validates :watering_interval, presence: true

  has_many :watering_events, dependent: :destroy
  has_many :notifications, dependent: :destroy
  belongs_to :user
end
