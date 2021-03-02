class City < ApplicationRecord
  has_many :city_comments
  has_many :bookmarks
end
