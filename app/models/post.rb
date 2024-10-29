class Post < ApplicationRecord
  validates :location_name, presence: true, length: { maximum: 255 }
  validates :address, presence: true
  validates :start_hour, :end_hour, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 24 }
  validates :start_minute, :end_minute, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 60 }
  validates :description, presence: true, length: { maximum: 65_535 }
  validates :quiet_level, presence: true
  validates :genre, presence: true


  belongs_to :user
end
