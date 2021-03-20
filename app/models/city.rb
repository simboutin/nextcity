class City < ApplicationRecord
  # searchkick
  has_many :users
  has_many :city_comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many_attached :photos
  serialize :geo_shape, Hash

  geocoded_by :address
end
