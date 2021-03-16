class City < ApplicationRecord
  searchkick
  has_many :city_comments
  has_many :bookmarks
  has_many :users, dependent: :destroy
  has_many :city_comments, dependent: :destroy
  has_one :bookmarks, dependent: :destroy
  has_one_attached :photo

  geocoded_by :address
end
