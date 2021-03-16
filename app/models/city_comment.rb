class CityComment < ApplicationRecord
  belongs_to :city
  belongs_to :user
  has_one :answer

  validates :content, presence: true

  scope :with_no_answer, -> { includes(:answer).where(answer: { id: nil }).order(created_at: :desc) }
  scope :with_answer, -> { includes(:answer).where.not(answer: { id: nil }).order(created_at: :desc) }
end

