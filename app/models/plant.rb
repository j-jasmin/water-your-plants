class Plant < ApplicationRecord
  validates :name, presence: true

  has_many :watering_events, dependent: :destroy
  belongs_to :user
end
