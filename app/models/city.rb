class City < ApplicationRecord
  searchkick
  has_many :city_comments
  has_many :bookmarks
  has_one_attached :photo
end
