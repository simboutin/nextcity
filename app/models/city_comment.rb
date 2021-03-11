class CityComment < ApplicationRecord
  belongs_to :city
  belongs_to :user
  has_one :answer

  validates :content, presence: true

  scope :with_answer, -> { where(answer: true) }
  scope :with_no_answer, -> { where(!with_answer)}
end
