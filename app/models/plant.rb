class Plant < ApplicationRecord
  has_one_attached :photo

  validates :common_name, presence: true

  has_many :watering_events, dependent: :destroy
  belongs_to :user
end
