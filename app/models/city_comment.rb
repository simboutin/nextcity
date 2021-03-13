class CityComment < ApplicationRecord
  belongs_to :city
  belongs_to :user
  has_one :answer

  validates :content, presence: true

  scope :with_no_answer, -> { includes(:answer).where(answer: { id: nil }) }
  scope :with_answer, -> { includes(:answer).where.not(answer: { id: nil }) }
end

