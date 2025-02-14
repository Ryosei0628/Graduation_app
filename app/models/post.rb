require "geocoder"

class Post < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  validates :location_name, presence: true, length: { maximum: 255 }
  validates :address, presence: true
  validates :description, presence: true, length: { maximum: 65_535 }
  validates :quiet_level, presence: true
  validates :genre, presence: true

  # ブックマークのアソシエーション
  belongs_to :user
  has_many :bookmarks, dependent: :destroy

  enum genre: { cafe: 0, library: 1, park: 2, coworking_space: 3, study_room: 4, other: 5 }
  enum wifi: { available: 0, not_available: 2 }
  enum electricity: { is_available: 0, isnot_available: 2 }
  enum quiet_level: { noisy: 1, # 日常の騒がしさ　
  slightly_quiet: 2, # 少し静か
  relatively_quiet: 3, # 比較的静か
  quiet: 4,         # 静か
  very_quiet: 5 }

  def business_hours
    if start_time.present? && end_time.present?
    start_formatted = start_time.strftime("%H時%M分")
    end_formatted = end_time.strftime("%H時%M分")
    "#{start_formatted} - #{end_formatted}"
    else
    "営業時間未設定"
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    super + [ "location_name", "address", "genre" ] # 検索可能な属性名を指定  # genreカラムを追加して検索対象にする
  end

  def self.ransackable_associations(auth_object = nil)
    [] # アソシエーションを検索対象にしない
  end

  belongs_to :user
  mount_uploader :post_image, PostImageUploader
end
