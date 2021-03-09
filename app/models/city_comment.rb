class CityComment < ApplicationRecord
  belongs_to :city
  belongs_to :user

  validates :content, presence: true

end
