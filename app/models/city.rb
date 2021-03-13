class City < ApplicationRecord
  has_many :city_comments
  has_many :bookmarks
  has_one_attached :photo

  geocoded_by :address


end
